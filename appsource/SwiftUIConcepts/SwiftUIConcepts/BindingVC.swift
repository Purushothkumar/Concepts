//
//  BindingVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 09/07/24.
//

import SwiftUI

struct BindingVC: View {
    @State var backgroundColor:Color = Color.green
    @State var title = "Inital"

    var body: some View {
        ZStack{
            backgroundColor.edgesIgnoringSafeArea(.all)
            VStack {
                Text(title)
                    .font(.largeTitle)
                .foregroundColor(Color.white)
                ButtonView(backgroundColor: $backgroundColor, title: $title)

            }
        }
    }
}

#Preview {
    BindingVC()
}

struct ButtonView:View{
    @Binding var backgroundColor:Color
    @Binding var title:String
    @State var buttonColor: Color = .blue
    var body: some View{
        Button(action: {
            backgroundColor = Color.gray
            buttonColor = Color.orange
            title = "Color Changed"
        }, label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal, 40)
                .background(buttonColor)
                .cornerRadius(10)
        })
    }
}
