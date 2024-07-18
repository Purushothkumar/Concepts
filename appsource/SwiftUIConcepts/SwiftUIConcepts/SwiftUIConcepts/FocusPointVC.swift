//
//  FocusPointVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 17/07/24.
//

import SwiftUI

struct FocusPointVC: View {
    @State private var username:String = ""
    @FocusState private var focususername:Bool

    var body: some View {
        VStack{
            TextField("Add your name", text: $username)
                .padding(40)
                .frame(height: 44)
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
                .background(Color.gray.brightness(0.40))
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)

        }
        .padding(20)
    }
}

#Preview {
    FocusPointVC()
}
