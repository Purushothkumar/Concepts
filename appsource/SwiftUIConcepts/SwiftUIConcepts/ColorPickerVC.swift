//
//  ColorPickerVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 11/07/24.
//

import SwiftUI

struct ColorPickerVC: View {
    @State var bgColor = Color.accentColor
    var body: some View {
        ZStack {

            bgColor.edgesIgnoringSafeArea(.all)
            VStack {
                ColorPicker("AppColor", selection: $bgColor, supportsOpacity: true).padding().font(.title).foregroundColor(.white).background(Color.black).cornerRadius(10).padding(20)
                Spacer()

            }

        }
    }
}

#Preview {
    ColorPickerVC()
}
