//
//  MovieDemoApp.swift
//  Shared
//
//  Created by Tian on 2020/7/2.
//

import SwiftUI

@main
struct MovieDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(movies: MovieList)
        }
    }
}

struct MovieDemoApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
