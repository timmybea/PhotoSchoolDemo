//
//  Environment.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 2020-05-02.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import SwiftUI
import AVKit

struct ImageCacheKey: EnvironmentKey {
    
    static let defaultValue: ImageCache = TemporaryImageCache()
    
}

//struct AVPlayerKey : EnvironmentKey {
//
//    static let defaultValue: AVPlayer = AVPlayer()
//
//}

extension EnvironmentValues {

    var imageCache: ImageCache {
        get {
            self[ImageCacheKey.self]
        }
        set {
            self[ImageCacheKey.self] = newValue
        }
    }
    
//    var player: AVPlayer {
//        get {
//            self[AVPlayerKey.self]
//        }
//        set {
//            self[AVPlayerKey.self] = newValue
//        }
//    }

}
