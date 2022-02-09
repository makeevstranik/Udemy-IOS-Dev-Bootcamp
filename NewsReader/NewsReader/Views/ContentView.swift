//
//  ContentView.swift
//  NewsReader
//
//  Created by Евгений Макеев on 07.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var readerManager = ReaderManager()
    
    var body: some View {
        NavigationView {
            
            List(readerManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url ), label: {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                })
                
            }
            .navigationTitle("NewsReader")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: {
            self.readerManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

