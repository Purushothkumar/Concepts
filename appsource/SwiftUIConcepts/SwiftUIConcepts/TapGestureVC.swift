//
//  TapGestureVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 12/07/24.
//

import SwiftUI

struct TapGestureVC: View {
    @State var isDarkTheme  = false

    var body: some View {
        VStack(alignment: .center, content: {

            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(isDarkTheme ? .green : .blue)
                .frame(width: 200,height: 100)

            Button(action: {
                isDarkTheme = false
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)

            })
            Text("Tap Gesture")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(20)
            //Single tap

//                .onTapGesture {
//                    isDarkTheme = true
//                }

            // double tap
            
                .onTapGesture(count: 2, perform: {
                    isDarkTheme = true
                })
            Spacer()
        }).padding()

    }
}

#Preview {
    TapGestureVC()
}
