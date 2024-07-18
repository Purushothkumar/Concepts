//
//  SafeAreaVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 08/07/24.
//

import SwiftUI

struct SafeAreaVC: View {
    var body: some View {
//        ZStack {
//
//            //background
//            Color.red
//                .edgesIgnoringSafeArea(.all)
//            //foreground
//            VStack {
//                Text("Hello, World!")
//                Spacer()
//            }
//                    .frame(maxWidth: .infinity,maxHeight: .infinity)
//                    .background(Color.blue)
//        }

            ScrollView{
                Text("hi").font(.largeTitle).frame(maxWidth: .infinity, alignment: .center)
                ForEach(0..<10) { Index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.white)
                        .frame(height:150)
    //                    .background(Color.white)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(20)
                }
            }
            .background(
                Color.red
                    .ignoresSafeArea(.all)
            )
    }
}

#Preview {
    SafeAreaVC()
}
