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
    
    @ObservedObject private var videoPlayer: VideoPlayer
    
    @State private var shouldShowPauseButton = true
    
    init(_ imageLoader: ImageLoader, videoPlayer: VideoPlayer) {
        self.loader = imageLoader
        self.videoPlayer = videoPlayer
    }
    
    var body: some View {
        ZStack {
            VideoPlayerView(self.videoPlayer, thumbnail: loader.image)
            if videoPlayer.itemReady {
                //play
                Button(action: {
                    self.videoPlayer.player.rate = self.videoPlayer.player.rate == 0 ? 1.0 : 0.0
                    self.shouldShowPauseButton = self.videoPlayer.player.rate == 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.shouldShowPauseButton = false
                    }
                }) {
                    if self.videoPlayer.player.rate == 0 {
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .foregroundColor(.white)
                    } else {
                        ZStack {
                            Rectangle().foregroundColor(.clear)
                            
                            if shouldShowPauseButton {
                                Image(systemName: "pause.circle")
                                    .resizable()
                                    .frame(width: 32.0, height: 32.0)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            self.loader.load()
        }
        .onDisappear {
            self.loader.cancel()
            self.shouldShowPauseButton = true
        }
    }

}
