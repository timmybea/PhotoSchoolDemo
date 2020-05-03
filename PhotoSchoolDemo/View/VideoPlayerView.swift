//
//  VideoPlayerView.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 2020-05-02.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import SwiftUI
import AVFoundation

struct VideoPlayerView: UIViewRepresentable {
    
    let videoPlayer: VideoPlayer
    let thumbnail: UIImage?
    
    init(_ videoPlayer: VideoPlayer, thumbnail: UIImage?) {
        self.videoPlayer = videoPlayer
        self.thumbnail = thumbnail
    }
        
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<VideoPlayerView>) {
        let currentThumbnail = self.thumbnail ?? UIImage(systemName: "photo")!
        uiView.layer.contents = currentThumbnail.cgImage
        uiView.layer.contentsGravity = .resizeAspect
        
    }
    
    func makeUIView(context: Context) -> UIView {
        let currentThumbnail = self.thumbnail ?? UIImage(systemName: "photo")!
        return VideoPlayerUIView(videoPlayer, thumbnail: currentThumbnail)
    }
    
}

class VideoPlayerUIView: UIView {
    
    private let playerLayer: AVPlayerLayer

    init(_ player: AVPlayer, thumbnail: UIImage) {
        
        self.playerLayer = AVPlayerLayer(player: player)
        self.playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill

        super.init(frame: .zero)
        
        self.layer.contents = thumbnail.cgImage
        self.layer.contentsGravity = .resizeAspectFill
        
        self.playerLayer.frame = layer.bounds
        self.layer.addSublayer(self.playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.playerLayer.frame = self.bounds
        CATransaction.commit()
    }
}
