//
//  VideoService.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 4/30/20.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import Foundation
import Combine

protocol WebServiceVideo {
     func getTestVideos() -> AnyPublisher<VideoResult, Error>
}

class VideoService : WebService, WebServiceVideo {
    
    enum VideoURL {
        case getTestVideos
        
        var url: URL {
            switch self {
            case .getTestVideos:
                return URL(string: "https://iphonephotographyschool.com/test-api/videos")!
            }
        }
    }
    
    func getTestVideos() -> AnyPublisher<VideoResult, Error> {
        return URLSession.shared.dataTaskPublisher(for: VideoURL.getTestVideos.url)
            .tryMap { try self.validate($0.data, $0.response) }
            .decode(type: VideoResult.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
