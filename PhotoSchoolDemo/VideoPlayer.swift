//
//  VideoPlayer.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 2020-05-02.
//  Copyright © 2020 Tim Beals. All rights reserved.
//
import Combine
import AVKit

//MARK: VideoPlayer
class VideoPlayer: ObservableObject {

    static let shared: VideoPlayer = VideoPlayer()
    
    private init() {}
    
    private var _player: AVPlayer = AVPlayer()
    
    var player: AVPlayer {
        return _player
    }
    
    private var itemStatusObserver: NSKeyValueObservation?
    
    @Published var itemReady: Bool = false
    
    func updatePlayerItem(_ item: AVPlayerItem?) {
        self.itemReady = false
        self.player.replaceCurrentItem(with: item)
        
        self.itemStatusObserver = self.player.observe(\AVPlayer.currentItem?.status, options:  [.new, .old], changeHandler: { (playerItem, change) in
           
            if playerItem.status == .readyToPlay {
                print("HERE: set item ready true")
                self.itemReady = true
            } else {
                print("HERE: set item ready true")
                self.itemReady = false
            }
        })
    }
    
    deinit {
        self.itemStatusObserver?.invalidate()
    }
    
    
}
