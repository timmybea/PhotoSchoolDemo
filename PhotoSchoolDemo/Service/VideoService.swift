//
//  VideoService.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 4/30/20.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import Foundation

class VideoService : WebService {
    
    enum VideoURL {
        case getTestVideos
        
        var url: URL {
            switch self {
            case .getTestVideos:
                return URL(string: "https://iphonephotographyschool.com/test-api/videos")!
            }
        }
    }
    
    func getVideos(_ completion: @escaping(Result<[Video], Error>)->()) {
        
        let request = URLRequest(url: VideoURL.getTestVideos.url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard let httpURLResponse = response as? HTTPURLResponse else {
                completion(.failure(WebServiceError.noResponse))
                return
            }
                
            switch httpURLResponse.statusCode {
            case 200:
                guard let unwrappedData = data else {
                    completion(.failure(WebServiceError.noData))
                    return
                }
                    
                guard let videoResult = try? JSONDecoder().decode(VideoResult.self, from: unwrappedData) else {
                    completion(.failure(WebServiceError.parsing))
                    return
                }
                    
                completion(.success(videoResult.videos))
                
            default:
                completion(.failure(WebServiceError.badStatus(httpURLResponse.statusCode)))
            }
            
        }.resume()
        
    }
    
}
