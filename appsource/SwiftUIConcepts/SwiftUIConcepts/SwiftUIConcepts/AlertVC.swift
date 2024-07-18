//
//  AlertVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 10/07/24.
//

import SwiftUI

struct AlertVC: View {

    @State var showAlert = false
    @State var backgroundColor = Color.white

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            Button(action: {
                showAlert.toggle()
                backgroundColor = .blue
            }, label: {
                Text("Button")
            })
            .alert(isPresented: $showAlert, content: {
                /*Alert(title: Text("Alert Message"),dismissButton: .cancel()*/
                Alert(title: Text("text"), message: Text("message"), primaryButton: .destructive(Text("delete"), action: {
                    backgroundColor = .red
                }), secondaryButton: .cancel(Text("dismiss"), action: {
                    backgroundColor = .green

                }))
        })
        }
    }
}

#Preview {
    AlertVC()
}
