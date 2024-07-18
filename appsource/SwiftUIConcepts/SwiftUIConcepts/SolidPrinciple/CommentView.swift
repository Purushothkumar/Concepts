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
                    ForEach(viewModel.users) { comment in
                        HStack(alignment: .top,spacing: 10){
                            let id = comment.id != nil ? "\(String(describing: comment.id!))" : "No ID"
                            Text(id).font(.title).foregroundColor(.red)
                            VStack(alignment: .leading,spacing: 5) {
                                Text(comment.name ?? "No Name").font(.title).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                Text(comment.email ?? "No Email").font(.title).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            }
                        }.padding(10)
                    }
                }
            }.onAppear(perform: {
                viewModel.fetchUsers()
            })
            .navigationTitle("Comment List")
        }
    }
}

#Preview {
    CommentView()
}
