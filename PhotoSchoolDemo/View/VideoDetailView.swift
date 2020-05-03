//
//  VideoDetailView.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 2020-05-02.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import SwiftUI
import AVFoundation

struct VideoDetailView: View {
    
    private var video: Video
    
    @Environment(\.videoPlayer) private var videoPlayer: VideoPlayer
    
    @ObservedObject private var loader: ImageLoader
    
    init(_ video: Video, cache: ImageCache? = nil) {
        self.loader = ImageLoader(url: URL(string: video.thumbnail)!, cache: cache)
        self.video = video
    }
        
    var body: some View {
        VStack(spacing: 8.0) {
            VideoPlayerView(self.videoPlayer, thumbnail: loader.image).aspectRatio(4/3, contentMode: .fit).cornerRadius(4)
            Text(video.name).font(.headline).multilineTextAlignment(.center)
            Text(video.description).font(.body)
            Spacer()
        }.padding(EdgeInsets(top: 0, leading: 16, bottom: 20, trailing: 16))
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("Download video")
            })
            .onAppear {
                self.loader.load()
                self.loadVideo()
        }
        .onDisappear {
            self.loader.cancel()
            self.removeVideo()
        }
    }
    
    fileprivate func loadVideo() {
        videoPlayer.replaceCurrentItem(with: AVPlayerItem(url: URL(string: video.videoLink)!))
        videoPlayer.play()
    }
    
    fileprivate func removeVideo() {
        videoPlayer.replaceCurrentItem(with: nil)
    }
      
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return VideoDetailView(PreviewVideoListData().videos.first!)
    }
}

