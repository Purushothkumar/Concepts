//
//  SheetVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 09/07/24.
//

import SwiftUI

struct SheetVC: View {
    @State var showSheet = false
    var body: some View {
        ZStack{
            Color.red.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Button(action: {
                showSheet.toggle()

            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    .foregroundColor(.blue)

            })
            Spacer()
        }
        .sheet(isPresented: $showSheet, content: {
            SheetSecondVC()
        })
    }
}

#Preview {
    SheetVC()
}
struct SheetSecondVC: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack (alignment: .topLeading){
            Color.green.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white )
                    .font(.largeTitle)
                    .padding(20)

            })
            Spacer()
        }
            }
}
