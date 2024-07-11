//
//  TextfieldVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 11/07/24.
//

import SwiftUI

struct TextfieldVC: View {
    @State var textfieldtext = ""
    @State var arraytext = [String]()

    var body: some View {
        ZStack {
            Color.pink.edgesIgnoringSafeArea(.all)
            NavigationView {
                ScrollView{
                    VStack {
                        TextField("placeholder", text: $textfieldtext)
                            .foregroundColor(.blue)
                            .padding()
                            .padding(20)
                            .textFieldStyle(.roundedBorder).background(Color.gray)
                        Spacer()

                        Button("Save") {
                            saveText()
                        }.background(Color.white)
                            .padding()
                            .padding(10)
//                            .disabled(textfieldtext.isEmpty ? true : false)

                        ForEach(arraytext, id: \.self) { data in
                            Text(data)
                        }
                        Spacer()
                    }.navigationTitle("TextField")
                        .navigationBarTitleDisplayMode(.automatic)
                        .background(Color.green)

                }

            }
        }
    }
    func saveText(){
        if (textfieldtext.isEmpty){
            arraytext.append(textfieldtext)
            textfieldtext = ""
        }
    }
}

#Preview {
    TextfieldVC()
}
