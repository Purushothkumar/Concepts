//
//  SheetanimationVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 09/07/24.
//

import SwiftUI

struct SheetanimationVC: View {
    @State var showVC  = false
    var body: some View {
        ZStack(alignment: .center, content: {
            Color.pink.edgesIgnoringSafeArea(.all)
            Button(action: {showVC.toggle()}, label: {
                Image(systemName: "")
            })

        }
    }
}

#Preview {
    SheetanimationVC()
}

struct NewSheetanimationVC: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
