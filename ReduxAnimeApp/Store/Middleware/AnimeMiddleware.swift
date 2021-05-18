//
//  AnimeMiddleware.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/04.
//

import Foundation

func animeMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case _ as FetchAnimes:
            AnimeService().fetchAnimes { result in
                switch result {
                case .success(let animes):
                    if let animes = animes {
                        dispatch(SetAnimes(animes: animes))
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
