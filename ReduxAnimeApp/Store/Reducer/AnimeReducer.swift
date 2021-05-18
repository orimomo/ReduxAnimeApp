//
//  AnimeReducer.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/04.
//

import Foundation

func animeReducer(_ state: AnimeState, action: Action) -> AnimeState {
    var state = state

    switch action {
    case let action as SetAnimes:
        state.animes = action.animes
    default:
        break
    }

    return state
}
