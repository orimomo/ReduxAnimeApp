//
//  Const.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/03.
//

import Foundation

struct Const {

    static let url = "https://api.annict.com/v1/works?fields=id,title,images,official_site_url&per_page=50&sort_watchers_count=desc&filter_season=\(getSeason())&access_token=\(AccessToken.annict)"

    static private func getSeason() -> String {
        let calendar = Calendar(identifier: .gregorian)
        let date = Date()
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)

        switch month {
        case 1...3:
            return "\(year)-winter"
        case 4...6:
            return "\(year)-spring"
        case 7...9:
            return "\(year)-summer"
        case 10...12:
            return "\(year)-autumn"
        default:
            return ""
        }
    }
}
