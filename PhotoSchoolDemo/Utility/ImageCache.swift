//
//  ImageCache.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 2020-05-03.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import UIKit

//MARK: ImageCache protocol
protocol ImageCache {
    subscript(_ url: URL) -> UIImage? { get set }
}

//MARK: EnvironmentImageCache
struct EnvironmentImageCache: ImageCache {
    
    private let cache = NSCache<NSURL, UIImage>()
    
    subscript(_ key: URL) -> UIImage? {
        get {
            return cache.object(forKey: key as NSURL)
        }
        set {
            newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL)
        }
    }
    
}
