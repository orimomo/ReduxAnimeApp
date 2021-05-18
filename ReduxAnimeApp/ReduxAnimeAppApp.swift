//
//  ReduxAnimeAppApp.swift
//  ReduxAnimeApp
//
//  Created by cw-orita on 2021/05/03.
//

import SwiftUI

@main
struct ReduxAnimeAppApp: App {
    var body: some Scene {

        let store = Store(reducer: appReducer, state: AppState(), middlewares: [animeMiddleware()])

        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
