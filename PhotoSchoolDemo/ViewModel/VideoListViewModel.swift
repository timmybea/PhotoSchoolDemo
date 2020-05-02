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
    
    private let videoService: WebServiceVideo
    
    var cancellable: AnyCancellable?
    
    init(_ webServiceVideo: WebServiceVideo) {
        self.videoService = webServiceVideo
        
        cancellable = self.videoService.getTestVideos()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    print("Error: \(error.localizedDescription), File: \(#file), Line: \(#line)")
                case .finished:
                    break
                }
            }, receiveValue: { (videoResult) in
                self.videos = videoResult.videos.map({ VideoViewModel($0) })
            })
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
    
    var description: String {
        return video.description
    }
    
    var thumbnailURL: URL {
        return URL(string: video.thumbnail)!
    }
    
}
