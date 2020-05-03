//
//  ActionableVideoView.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 2020-05-03.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import SwiftUI

struct ActionableVideoView: View {
        
    @ObservedObject private var loader: ImageLoader
    
    @ObservedObject private var videoPlayer: VideoPlayer = VideoPlayer.shared
    
    init(_ imageLoader: ImageLoader) {
        self.loader = imageLoader
    }
    
    var body: some View {
        ZStack {
            VideoPlayerView(self.videoPlayer, thumbnail: loader.image)
            if videoPlayer.itemReady && videoPlayer.player.rate == 0 {
                //play
                Button(action: {
                    print("Button tapped")
                    self.videoPlayer.player.rate = 1
                }) {
                    Text("Play video")
                    
                }
            } else if videoPlayer.itemReady {
                //pause
                Button(action: {
                    print("Button tapped")
                    self.videoPlayer.player.rate = 0
                }) {
                    Text("Pause video")
                }
            }
        }
        .onAppear {
            self.loader.load()
        }
        .onDisappear {
            self.loader.cancel()
            
        }
    }

}

//struct ActionableVideoView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionableVideoView()
//    }
//}
