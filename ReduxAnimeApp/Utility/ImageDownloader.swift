//
//  ImageDownloader.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/06.
//

import Foundation

class ImageDownloader: ObservableObject {

    @Published var downloadedData: Data? = nil

    func downloadImage(url: String) {

        guard let imageURL = URL(string: url) else { return }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }
    }
}
