//
//  Video.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 4/30/20.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import Foundation

struct VideoResult : Codable {
    var videos: [Video]
}

struct Video : Codable {
    var id: Int
    var name: String
    var thumbnail: String
    var description: String
    var videoLink: String
    
    enum VideoKey : String, CodingKey {
        case id
        case name
        case thumbnail
        case description
        case videoLink = "video_link"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: VideoKey.self)
        
        let id = try container.decode(Int.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let thumbnail = try container.decode(String.self, forKey: .thumbnail)
        let description = try container.decode(String.self, forKey: .description)
        let videoLink = try container.decode(String.self, forKey: .videoLink)
        
        self.init(id: id, name: name, thumbnail: thumbnail, description: description, videoLink: videoLink)
    }
    
    init(id: Int, name: String, thumbnail: String, description: String, videoLink: String) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.description = description
        self.videoLink = videoLink
    }
}
