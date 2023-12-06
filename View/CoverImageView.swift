//
//  CoverImageView.swift
//  Africa
//
//  Created by Mark Nair on 12/4/23.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: PROPERTIES
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    
    //MARK: BODY
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            }
        }// End of Tab
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 300)) {
    CoverImageView()
}
