//
//  ContentView.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 24/06/24.
//

import SwiftUI


struct ContentView: View {
    @State private var products: [Product] = []
    @ObservedObject var contentViewModel = ContentViewModel()

    var body: some View {
        NavigationView{
            List(contentViewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.subheadline)
                }
                .padding()
            }
            .onAppear {
                contentViewModel.fetchProducts()
            }
        }
               .navigationTitle("Posts")
    }
    
}

#Preview {
    ContentView()
}
