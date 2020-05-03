//
//  Environment.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 2020-05-02.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import SwiftUI
import AVKit

//MARK: EnvironmentValues
struct ImageCacheKey: EnvironmentKey {
    
    static let defaultValue: ImageCache = EnvironmentImageCache()
    
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

}
