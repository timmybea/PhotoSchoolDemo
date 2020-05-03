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
        
    @Published var videos = [Video]()
    
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
                self.videos = videoResult.videos.map({ $0 })
            })
    }
}
