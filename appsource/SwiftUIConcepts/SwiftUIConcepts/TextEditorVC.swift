//
//  TextEditorVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 11/07/24.
//

import SwiftUI

struct TextEditorVC: View {
    @State var textdata = ""
    var body: some View {
        NavigationView {
            VStack{
                TextEditor(text: $textdata)
                    .frame(height: .infinity)
                    .foregroundColor(.red)
                    .cornerRadius(10)
                    .padding()
                    .padding(10)
//                    .foregroundColor(.accentColor)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("save")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                }).padding()
                Spacer()
            }.navigationTitle("TextEditorVC")
                .background(Color.red)
                .padding()
        }
    }
}

#Preview {
    TextEditorVC()
}
