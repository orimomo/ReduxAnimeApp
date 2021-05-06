//
//  AnimeRow.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/06.
//

import SwiftUI

struct AnimeRow: View {

    let anime: Anime

    var body: some View {
        HStack {
            if let imageURL = anime.getRecommendedImageURL() {
                URLImage(url: imageURL)
                    .cornerRadius(4)
                    .scaledToFit()
                    .frame(width: 100, height: 60)

            }
            Text(anime.title)
        }
    }
}

//struct AnimeRow_Previews: PreviewProvider {
//    static var previews: some View {
//
//    }
//}
