//
//  AnimeMiddleware.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/04.
//

import Foundation

func AnimeMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case _ as fetchAnimes:
            AnimeService().fetchAnimes { result in
                switch result {
                case .success(let animes):
                    if let animes = animes {
                        dispatch(setAnimes(animes: animes))
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            break
        }
    }
}
