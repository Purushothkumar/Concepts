//
//  StateVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 09/07/24.
//

import SwiftUI

struct StateVC: View {
    @State var backgroundcolor = Color.accentColor
    var body: some View {
        ZStack {
            backgroundcolor.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Hello, World!")
                    .font(.largeTitle)
                Text("Color")
                    .font(.title)

                HStack {
                    Button("Red Button".uppercased()) {
                        backgroundcolor = Color.red
                    }

                    Button("Green Button".uppercased()) {
                        backgroundcolor = Color.green
                    }
                }.foregroundColor(Color.white) 
            }
        }
    }
}

#Preview {
    StateVC()
}
