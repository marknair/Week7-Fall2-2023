//
//  VideoListView.swift
//  Africa
//
//  Created by Mark Nair on 12/4/23.
//

import SwiftUI

struct VideoListView: View {
    //MARK: PROPERTIES
    
    @State private var videos: [Video] = Bundle.main.decode("videos.json")
    
    
    //MARK: BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(videos) { item in
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                }
            }
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            }
        }
    }
}

#Preview {
    VideoListView()
}
