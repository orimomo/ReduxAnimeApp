//
//  Action.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/03.
//

import Foundation

protocol Action { }

struct FetchAnimes: Action { }

struct SetAnimes: Action {
    let animes: [Anime]
}
