//
//  ContentView.swift
//  Shared
//
//  Created by Tian on 2020/7/2.
//

import SwiftUI

struct ContentView: View {
    var movies:[Movie]

    var body: some View {
        NavigationView{
            List {
                ForEach(movies) { (movie) in
                    MovieItem(movie: movie)
                }
            }
        }.navigationTitle(Text("Featured"))
    }
}

struct MovieItem: View {
    var movie: Movie
    var body: some View {
        NavigationLink(
            destination: MovieDetail(movie: movie),
            label: {
                Image("\(movie.image)")
                    .resizable(capInsets: EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5), resizingMode: .stretch)
                    .frame(width: 100, height: 140, alignment: .leading)
                    .cornerRadius(5)
                VStack {
                    Text("\(movie.name)").padding()
                        .frame(width: 200, height: 50, alignment: .leading)
                        .foregroundColor(.blue)
//                        .border(Color.orange, width: 1)
                    Text("🚗🚗").border(Color.blue, width: 2).padding(.all, 10)
                }
            })
    }
}

struct MovieDetail : View {
    var movie: Movie
    var body: some View {
        
        VStack {
            Image(movie.image)
                .fixedSize().cornerRadius(5)
            //.resizable(capInsets: EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0), resizingMode: .stretch)
            Text("\(movie.name)")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(movies: MovieList)
            ContentView(movies: MovieList)
                .preferredColorScheme(.dark)
                
        }
    }
}
