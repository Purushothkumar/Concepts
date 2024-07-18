//
//  ListVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 10/07/24.
//

import SwiftUI

struct ListVC: View {
    @State var vowels = ["A", "B", "C","E"]
    @State var numbers = ["1", "2", "3","4"]

    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Fruits").font(.largeTitle)) {
                    ForEach(vowels, id: \.self) { vowel in
                        Text("\(vowel)").font(.title)
                    }
    //                .onDelete(perform: { indexSet in
    //                    //                    fruits.remove(atOffsets: indexSet)
    //                    delete(indexSet: indexSet)
    //                })
                    .onDelete(perform: delete)
                    .onMove(perform: { indices, newOffset in
                        vowels
                    })
                }
                Section(header: Text("numbers".uppercased()).font(.largeTitle)) {
                    ForEach(numbers, id: \.self) { number in
                        Text("\(number)").font(.title)
                    }
                }
            }
            .navigationTitle("Alphabets")
            .navigationBarItems(leading:
                                    EditButton(), trailing:addButton )
        }
    }
    var addButton: some View{
        Button(action: {}, label: {
Text("Add")
})
    }
    func delete(indexSet: IndexSet){
        vowels .remove(atOffsets: indexSet)

    }
}

#Preview {
    ListVC()
}
