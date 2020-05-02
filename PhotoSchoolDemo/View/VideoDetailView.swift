//
//  VideoDetailView.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 2020-05-02.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import SwiftUI

struct VideoDetailView: View {
    
    private var video: VideoViewModel
    
    init(_ video: VideoViewModel) {
        self.video = video
    }
    
    var body: some View {
        VStack(spacing: 8.0) {
            Rectangle().aspectRatio(4/3, contentMode: .fit).cornerRadius(4)
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
    }
}


struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return VideoDetailView(PreviewVideoListData().videos.first!)
    }
}
