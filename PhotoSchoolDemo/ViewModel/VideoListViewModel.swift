//
//  VideoListViewModel.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 4/30/20.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import Foundation
import Combine

class VideoListViewModel : ObservableObject {
    @Published var videos = [VideoViewModel]()
    
    init() {
        VideoService().getVideos { (result) in
            switch result {
            case .success(let videos):
                DispatchQueue.main.async {
                    self.videos = videos.map({ VideoViewModel($0) })
                }
            case .failure(let error):
                print("\(error.localizedDescription), File: \(#file), Line: \(#line)")
            }
        }
    }
}

struct VideoViewModel {
    
    private var video: Video
    
    init(_ video: Video) {
        self.video = video
    }
    
    var id: Int {
        return video.id
    }
    
    var name: String {
        return video.name
    }
    
    var thumbnail: String {
        return video.thumbnail
    }
    
}
