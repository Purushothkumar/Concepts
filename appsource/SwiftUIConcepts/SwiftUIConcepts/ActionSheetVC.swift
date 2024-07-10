//
//  ActionSheet.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 10/07/24.
//

import SwiftUI

struct ActionSheetVC: View {
    @State var bg = Color.accentColor
    @State var showActionSheet = false

    var body: some View {
        ZStack{
            bg.edgesIgnoringSafeArea(.all)
            VStack{
                Button(action: {
                    showActionSheet.toggle()

                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/.foregroundColor(.white).font(.largeTitle)
                })
            }
            .actionSheet(isPresented: $showActionSheet, content: {
                getActionSheet()
            })
        }

        }
    func getActionSheet() -> ActionSheet{
        let button1 :ActionSheet.Button = .default(Text("default"))
        let button2 :ActionSheet.Button = .destructive(Text("default"))
        let button3 :ActionSheet.Button = .cancel(Text("cancel"))
        return ActionSheet(title: Text("This is title"), message: Text("This is message"), buttons: [button1,button2,button3])
    }
}

#Preview {
    ActionSheetVC()
}
