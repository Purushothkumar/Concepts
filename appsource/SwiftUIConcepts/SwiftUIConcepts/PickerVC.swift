//
//  PickerVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 11/07/24.
//

import SwiftUI

struct PickerVC: View {

    @State var selection = ""
     var selectionarray = ["filter 1" ,"filter 2", "filter 3" ]

    var body: some View {
        VStack{
            HStack {
                Text("filter: ".capitalized)
                Text(selection).font(.largeTitle)
            }

            Picker(selection: $selection) {
                Text("1").tag("1")
                Text("2").tag("2")
                Text("3").tag("3")
                Text("4").tag("4")
                Text("5").tag("5")

            } label: {
                Text("Picker 1").font(.largeTitle)
            }.pickerStyle(.wheel)


            Picker(selection: $selection) {
                ForEach(0..<10, id: \.self) { index in
                    Text("\(index)").tag("\(index)")
                }
            } label: {
                Text("Picker 2").font(.largeTitle)
            }.pickerStyle(.menu)

            Picker(selection: $selection) {
                ForEach(selectionarray, id: \.self) { index in
                    Text("\(index)").tag("\(index)")
                }
            } label: {
                Text("Picker 3").font(.largeTitle)
            }
            .pickerStyle(.segmented)
                .background(Color.blue)

        }
    }
}

#Preview {
    PickerVC()
}
