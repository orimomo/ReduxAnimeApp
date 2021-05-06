//
//  Action.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/03.
//

import Foundation

protocol Action { }

struct fetchAnimes: Action { }

struct setAnimes: Action {
    let animes: [Anime]
}
