//
//  URLImage.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/06.
//

import SwiftUI

struct URLImage: View {

    let url: String
    @ObservedObject private var imageDownloader: ImageDownloader = ImageDownloader()

    init(url: String) {
        self.url = url
        self.imageDownloader.downloadImage(url: self.url)
    }

    var body: some View {
        if let imageData = self.imageDownloader.downloadedData {
            let img = UIImage(data: imageData)
            return VStack {
                Image(uiImage: img!).resizable()
            }
        } else {
            return VStack {
                Image("noImage").resizable()
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "")
    }
}
