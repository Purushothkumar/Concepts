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
            Button(action: {
                showVC.toggle()
            }, label: {
                Image(systemName: "folder")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            })
            .sheet(isPresented: $showVC, content: {
                NewSheetanimationVC()
            })
        })
    }
}

#Preview {
    SheetanimationVC()
}

struct NewSheetanimationVC: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .topLeading, content: {
            Color.yellow.edgesIgnoringSafeArea(.all)

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark").font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
            })
        })
    }
}
