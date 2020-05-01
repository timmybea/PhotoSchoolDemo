//
//  ContentView.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 4/30/20.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var videoListViewModel = VideoListViewModel(VideoService())
    @Environment(\.imageCache) var cache: ImageCache
    
    var body: some View {
        NavigationView {
            List(videoListViewModel.videos, id: \.id) { video in
                HStack {
                    AsyncImage(url: video.thumbnailURL, placeholder: Image(systemName: "photo"), cache: self.cache).frame(width: 40, height: 40).aspectRatio(contentMode: .fit).cornerRadius(4)
                    Text(video.name)
                }
            }.navigationBarTitle("Videos")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
