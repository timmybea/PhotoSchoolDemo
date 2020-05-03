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
    
    private var _player: AVPlayer = AVPlayer()
    
    var player: AVPlayer {
        return _player
    }
    
    private var itemStatusObserver: NSKeyValueObservation?
    private var playerRateObserver: NSKeyValueObservation?
    
    @Published var itemReady: Bool = false
    @Published var playerRate: Float = 0.0
    
    func updatePlayerItem(_ item: AVPlayerItem?) {
        self.itemReady = false
        self.player.replaceCurrentItem(with: item)
        
        self.itemStatusObserver = self.player.observe(\AVPlayer.currentItem?.status, options:  [.new, .old]) { [weak self] (playerItem, change) in
           
            if playerItem.status == .readyToPlay {
                self?.itemReady = true
            } else {
                self?.itemReady = false
            }
        }
        
        self.playerRateObserver = self.player.observe(\AVPlayer.rate, options: [.new]) { [weak self] (player, change) in
            self?.playerRate = player.rate
        }
        
    }
    
    deinit {
        self.itemStatusObserver?.invalidate()
    }
    
}
