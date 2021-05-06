//
//  AnimeService.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/04.
//

import Foundation

enum FetchAnimeError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

class AnimeService {

    func fetchAnimes(completionHandler: @escaping (Result<[Anime]?, FetchAnimeError>) -> Void) {
        guard let url = URL(string: Const.url) else {
            completionHandler(.failure(.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completionHandler(.failure(.invalidResponse))
                return
            }
            let animeResponse = try? JSONDecoder().decode(AnimeResponse.self, from: data)
            if let animeResponse = animeResponse {
                completionHandler(.success(animeResponse.animes))
            } else {
                completionHandler(.failure(.decodingError))
            }
        }.resume()
    }
}
