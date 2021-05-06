//
//  AppReducer.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/03.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {

    var state = state
    state.anime = animeReducer(state.anime, action: action)
    return state
}
