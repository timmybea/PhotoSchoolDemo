//
//  VideoRowView.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 2020-05-02.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import SwiftUI

struct VideoRowView: View {
    
    private let video: VideoViewModel
    
    @Environment(\.imageCache) private var cache: ImageCache
    
    init(_ video: VideoViewModel) {
        self.video = video
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: video.thumbnailURL, placeholder: Image(systemName: "photo"), cache: self.cache).frame(width: 40, height: 40).aspectRatio(contentMode: .fit).cornerRadius(4)
            Text(video.name).font(.callout).padding(.trailing, 4.0)
        }
    }
    
}

struct VideoRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        VideoRowView(PreviewVideoListData().videos.first!).previewLayout(.fixed(width: 300, height: 60))
    }
    
}
