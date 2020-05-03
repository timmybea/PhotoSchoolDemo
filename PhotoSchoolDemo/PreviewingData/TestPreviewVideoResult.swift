//
//  PreviewVideoListData.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 2020-05-02.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import Foundation

class TestPreviewVideoResult {
    
    var videoResult: VideoResult
    
    init() {
        self.videoResult = VideoResult(videos: [Video(id: 950,
              name: "TEST: How To Hold Your iPhone When Taking Photos",
              thumbnail: "https://i.picsum.photos/id/477/2000/2000.jpg",
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              videoLink: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"),
        Video(id: 7991,
              name: "TEST: 3 Quick Ways To Open The iPhone Camera App",
              thumbnail: "https://i.picsum.photos/id/254/2000/2000.jpg",
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              videoLink: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")])
    }
    
}
