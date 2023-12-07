//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Mark Nair on 12/7/23.
//

import SwiftUI
import AVKit


struct VideoPlayerView: View {
    var videoSelected: String
    var videoTitle: String
    
    var body: some View {
        VideoPlayer(player: playVideo(fileName: videoSelected, fileformat: "mp4")) {
            Text(videoTitle)
                .font(.title)
        }
    }
}

#Preview {
    VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
}
