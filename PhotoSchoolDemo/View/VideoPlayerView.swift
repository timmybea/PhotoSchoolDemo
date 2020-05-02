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
    
    @Environment(\.videoPlayer) private var videoPlayer: VideoPlayer
        
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<VideoPlayerView>) {
        
    }
    
    func makeUIView(context: Context) -> UIView {
        print("HERE: make ui view. have videoPlayer")
        return VideoPlayerUIView(videoPlayer)
    }
    
}

class VideoPlayerUIView: UIView {
    
    private let playerLayer: AVPlayerLayer

    init(_ player: AVPlayer) {
        print("HERE: init player ui view with player \(player)")
        
        self.playerLayer = AVPlayerLayer(player: player)
        self.playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        super.init(frame: .zero)
        
        self.layer.addSublayer(self.playerLayer)
        self.playerLayer.frame = layer.bounds
        self.backgroundColor = UIColor.darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        print("HERE: laying out player layer \(playerLayer)")
        //Match size of view
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.playerLayer.frame = self.bounds
        CATransaction.commit()
    }
}
