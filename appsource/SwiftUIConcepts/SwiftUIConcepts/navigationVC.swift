//
//  navigationVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 10/07/24.
//

import SwiftUI

struct navigationVC: View {
    var body: some View {
        NavigationView{
            ScrollView{
                NavigationLink("navigate") {
                    SecondNavigationVC()
                }
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
            }
            .navigationTitle("Navigation").font(.largeTitle)
//            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(leading:
                                    Image(systemName: "person")
                                    ,
                                trailing: NavigationLink(destination: SecondNavigationVC(), label: {
                Image(systemName: "gear").font(.largeTitle)
                    .foregroundColor(Color.red)
            }))
        }
    }
}

#Preview {
    navigationVC()
}

struct SecondNavigationVC: View {
    @Environment (\.presentationMode) var presentation
    var body: some View {
        ZStack{
            Color.red.edgesIgnoringSafeArea(.all)
                .navigationTitle("New")
            Button(action: {
                presentation.wrappedValue.dismiss()
            }, label: {
                Text("back")
            })
        }
    }
}

