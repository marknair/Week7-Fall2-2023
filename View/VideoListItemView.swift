//
//  VideoListItem.swift
//  Africa
//
//  Created by Mark Nair on 12/6/23.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: PROPERTIES
    let video: Video
    
    //A computed property
    var thumbnail: String {
        "video-\(video.id)"
    }
    
    
    //MARK: BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }//End of ZStack
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

let someVideos: [Video] = Bundle.main.decode("videos.json")

#Preview(traits: .sizeThatFitsLayout) {
    VideoListItemView(video: someVideos[1])
        .padding()
}
