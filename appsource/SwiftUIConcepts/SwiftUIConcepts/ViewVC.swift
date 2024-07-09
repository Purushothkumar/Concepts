//
//  ViewVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 09/07/24.
//

import SwiftUI

struct ViewVC: View {

    var body: some View {
        ZStack{
            contentLayer
        }
    }

    var contentLayer: some View {
        VStack{
            Myitems(title1: "title1", title2: "title2", bg1: Color.red, bg2: Color.green)
            Myitems(title1: "title3", title2: "title4", bg1: Color.pink, bg2: Color.purple)
            Myitems(title1: "title5", title2: "title6", bg1: Color.yellow, bg2: Color.orange)

        }
    }
}

#Preview {
    ViewVC()
}

struct Myitems: View {
    let title1:String
    let title2:String
    let bg1:Color
    let bg2:Color
    @State var backgroundcolor = Color.accentColor

    var body: some View {
        VStack {
            Text(title1)
                .font(.largeTitle)
            Text(title2)
                .font(.title)
            
            HStack {
                Button("Red Button".uppercased()) {
                    backgroundcolor = bg1
                }
                
                Button("Green Button".uppercased()) {
                    backgroundcolor = bg1
                }
            }.foregroundColor(Color.white)
        }
    }
}
