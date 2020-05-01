//
//  AsyncImage.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 2020-05-01.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import Foundation
import SwiftUI

struct AsyncImage<Placeholder: View>: View {
    
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    
    init(url: URL, placeholder: Placeholder? = nil, cache: ImageCache? = nil) {
        self.loader = ImageLoader(url: url, cache: cache)
        self.placeholder = placeholder
    }
    
    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}
