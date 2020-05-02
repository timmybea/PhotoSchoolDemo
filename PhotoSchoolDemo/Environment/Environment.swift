//
//  Environment.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 2020-05-02.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    
    static let defaultValue: ImageCache = TemporaryImageCache()
    
    
}

struct VideoPlayerKey: EnvironmentKey {
    
    static let defaultValue: VideoPlayer = VideoPlayer()
    
}

extension EnvironmentValues {

    var imageCache: ImageCache {
        get {
            self[ImageCacheKey.self]
        }
        set {
            self[ImageCacheKey.self] = newValue
        }
    }
    
    var videoPlayer: VideoPlayer {
        get {
            self[VideoPlayerKey.self]
        }
        set {
            self[VideoPlayerKey.self] = newValue
        }
    }

}
