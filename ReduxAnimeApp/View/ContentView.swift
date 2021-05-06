//
//  ContentView.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/03.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var store: Store<AppState>

    struct Props {
        let animes: [Anime]
        let fetchAnimes: () -> Void
    }

    private func map(state: AnimeState) -> Props {
        Props(animes: state.animes, fetchAnimes: {
            store.dispatch(action: fetchAnimes())
        })
    }

    var body: some View {
        let props = map(state: store.state.anime)

        NavigationView {
            List(props.animes, id: \.id) { anime in
                NavigationLink(
                    destination: AnimeDetailView(officialSiteUrl: anime.officialSiteUrl),
                    label: {
                        AnimeRow(anime: anime)
                    })
            }
            .onAppear(perform: {
                props.fetchAnimes()
            }).navigationBarTitle("今期のアニメ", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [AnimeMiddleware()])
        return ContentView().environmentObject(store)
    }
}
