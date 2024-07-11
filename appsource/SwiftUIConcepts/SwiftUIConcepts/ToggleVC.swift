//
//  ToggleVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 11/07/24.
//

import SwiftUI

struct ToggleVC: View {
    @State var toggle = false
    var body: some View {
        ZStack{
            Color.blue
            
            VStack{
                HStack{
                    Text("CurrentStatus : ")
                    Text(toggle ? "Online" : "Offline")
                    
                }
                Toggle(isOn: $toggle, label: {
                    HStack {
                        Text("Change Status").padding()
                        Image(systemName: "fibrechannel")
                    }
                })
                .toggleStyle(SwitchToggleStyle(tint: .green))
                Spacer()
            } .foregroundColor(.white)
                .padding()
        }
    }
}

#Preview {
    ToggleVC()
}
