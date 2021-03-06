//
//  ContentView.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 4/30/20.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import SwiftUI

struct VideoListView: View {
    
    @Environment(\.imageCache) private var cache: ImageCache
    
    @ObservedObject private var videoListViewModel: VideoListViewModel
    
    init(_ videoListViewModel: VideoListViewModel) {
        self.videoListViewModel = videoListViewModel
    }
    
    var body: some View {
        NavigationView {
            List(videoListViewModel.videos, id: \.id) { video in
                NavigationLink(destination: VideoDetailView(video: video, videoPlayer: VideoPlayer())) {
                    VideoRowView(video)
                }
            }.navigationBarTitle("Videos")
        }
    }
    
}

struct VideoListView_Previews: PreviewProvider {
    
    static var previews: some View {
        let videoResult = TestPreviewVideoResult().videoResult
        let videoListViewModel = VideoListViewModel(testPreviewData: videoResult.videos)
        return VideoListView(videoListViewModel)
    }
    
}

