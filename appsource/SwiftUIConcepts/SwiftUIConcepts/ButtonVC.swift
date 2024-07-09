//
//  ButtonVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 08/07/24.
//

import SwiftUI

struct ButtonVC: View {
    @State var title = "title"
    var body: some View {
//        Button("press me") {
//            self.title = "new"
//        }
        VStack{
            Text(self.title)
            Button ("Button 1"){
                self.title = "button 1 pressed"
            }.accentColor(.red  )
            Button(action: {
                self.title = "button 2 pressed"
            }, label: {
                Text("Button 2".uppercased())
                    .font(.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 30)
                    .background(Color.gray
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 5 )
                    )
            })
            Button(action: {                self.title = "button 3 pressed"}, label: {
                ZStack {
                    Circle()
                        .fill(Color.white)
//                        .overlay(content: {
//                            Image(systemName: "heart.fill")
//                        })
                        .frame(width: 100,height: 100)
                        .shadow(radius: 10)
                         
                }
            })
        }
    }
}

#Preview {
    ButtonVC()
}
