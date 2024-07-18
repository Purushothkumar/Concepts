//
//  PageVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 11/07/24.
//

import SwiftUI

struct PageVC: View {
    @State var selectedtab = 0
//    @State var backgroundcolor = Color.blue

    var body: some View {

        TabView {
            RoundedRectangle(cornerRadius: 25.0).foregroundColor(.blue)
            RoundedRectangle(cornerRadius: 25.0)
            RoundedRectangle(cornerRadius: 25.0).foregroundColor(.red)

        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 300)
    }
}

struct PageIconVC: View {
    @State var selectedtab = 0
    //    @State var backgroundcolor = Color.blue

    let icons = ["house","heart","person"]

    var body: some View {

        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon).resizable().scaledToFit()
            }

        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 300)
    }
}


#Preview {
    PageIconVC ()
}

