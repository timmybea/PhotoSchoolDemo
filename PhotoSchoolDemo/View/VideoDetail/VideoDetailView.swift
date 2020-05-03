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
        
    @Environment(\.imageCache) private var cache: ImageCache

    @ObservedObject private var videoPlayer: VideoPlayer = VideoPlayer()
            
    init(video: Video, videoPlayer: VideoPlayer) {
        self.video = video
        self.videoPlayer = videoPlayer
    }
        
    var body: some View {
        VStack(spacing: 8.0) {
            ActionableVideoView(ImageLoader(url: URL(string: video.thumbnail)!, cache: cache), videoPlayer: videoPlayer).aspectRatio(4/3, contentMode: .fit).cornerRadius(4)
            Text(video.name).font(.headline).multilineTextAlignment(.center)
            Text(video.description).font(.body)
            Spacer()
        }.padding(EdgeInsets(top: 0, leading: 16, bottom: 20, trailing: 16))
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    print("Button tapped")
                }) {
                    HStack {
                        Text("Download video")
                        Image(systemName: "square.and.arrow.down")
                    }
            })
            .onAppear {
                self.loadVideo()
        }
        .onDisappear {
            self.removeVideo()
        }
    }
    
    fileprivate func loadVideo() {
        videoPlayer.updatePlayerItem(AVPlayerItem(url: URL(string: video.videoLink)!))
    }
    
    fileprivate func removeVideo() {
        videoPlayer.updatePlayerItem(nil)
    }
      
}
