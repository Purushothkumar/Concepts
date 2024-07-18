//
//  OnAppearVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 12/07/24.
//

import SwiftUI

struct OnAppearVC: View {
    @State var newText = "Starting"
    var body: some View {

        NavigationView{
            ScrollView{
                Text(newText)
            }
        }
//       .onAppear(perform: {
//           DispatchQueue.main.async{
//               newText = "on appear"
//               print("on appear with delay")
//           }
//        })
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                newText = "on appear with delay"
                print("on appear with delay")
            }
        })
//        onDisappear(perform: {
////            newText = "on disappear"
//            print("on disappear")
//
//        })
            .navigationTitle("On AppearScreen")

    }
}

#Preview {
    OnAppearVC()
}
