//
//  CachingImageService.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 5/1/20.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import Foundation
import Combine
import SwiftUI



class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    private let url: URL
    
    fileprivate var cancellable: AnyCancellable?
    
//    deinit {
//        cancellable?.cancel()
//    }
    
    init(url: URL) {
        self.url = url
    }
    
    func load() {
//        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
        
        
        
    }
    
    func cancel() {}

}

struct AsyncImage<Placeholder: View>: View {
    
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    
    init(url: URL, placeholder: Placeholder? = nil) {
        self.loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }
    
    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        placeholder
    }
}
