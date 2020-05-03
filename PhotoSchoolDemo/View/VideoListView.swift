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
                NavigationLink(destination: VideoDetailView(video, cache: self.cache)) {
                    VideoRowView(video)
                }
            }.navigationBarTitle("Videos")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView(VideoListViewModel(VideoService()))
    }
}
