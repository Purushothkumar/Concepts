//
//  CommentView.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 18/07/24.
//

import SwiftUI

//https://demo1732301.mockable.io/SOLID

struct CommentView: View {
    @ObservedObject private var viewModel = CommentViewModel()

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.comments) { comment in
                        HStack(alignment: .top,spacing: 10){
                            let id = comment.id != nil ? "\(String(describing: comment.id!))" : "No ID"
                            Text(id).font(.title).foregroundColor(.red)
                            Text(comment.name ?? "No Comments").font(.title).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
            }.onAppear(perform: {
                viewModel.fetchComments()
            })
            .navigationTitle("Comment List")
        }
    }
}

#Preview {
    CommentView()
}
