//
//  AppReducer.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/03.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.animeState = animeReducer(state.animeState, action: action)
    return state
}
