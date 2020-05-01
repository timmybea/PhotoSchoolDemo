//
//  ContentView.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 4/30/20.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var videos = [Video]()
    
    var body: some View {
        NavigationView {
            List(videos, id: \.id) { video in
                HStack {
                    Image(systemName: "photo").resizable().frame(width: 50, height: 50)
                    Text(video.name)
                }
            }.navigationBarTitle("Videos")
                .onAppear {
                    self.loadData()
            }
        }
    }
    
    func loadData() {
        
        VideoService().getVideos { (result) in
            switch result {
            case .success(let videos):
                self.videos = videos
            case .failure(let error):
                print("\(error.localizedDescription), File: \(#file), line: \(#line)")
            }
        }
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
