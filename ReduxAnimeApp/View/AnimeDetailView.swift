//
//  AnimeDetailView.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/06.
//

import SwiftUI
import WebKit

struct AnimeDetailView: View {

    let officialSiteUrl: String

    var body: some View {
        WebView(urlString: officialSiteUrl)
    }
}

struct AnimeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeDetailView(officialSiteUrl: "http://ngnl.jp/tv/")
    }
}
