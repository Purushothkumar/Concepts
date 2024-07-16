//
//  ViewModelVC.swift
//  SwiftUIConcepts
//
//  Created by Purushothkumar on 16/07/24.
//

import SwiftUI

struct FruitModel:Identifiable{
    var id:String
    var count: Int
    var name: String
    init(id:String, count: Int, name: String) {
        self.id = id
        self.count = count
        self.name = name
    }
}

struct ViewModelVC: View {
    @State var fruitArray:[FruitModel] = [
        FruitModel(id: UUID().uuidString, count: 5, name: "APPLE"),
        FruitModel(id: UUID().uuidString, count: 10, name: "BANANA")]
    var body: some View {
        NavigationView {
            List{
                ForEach(fruitArray) { fruit in                  VStack(alignment: .leading, content: {
                    HStack{
                        Text("\(fruit.count)").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(.largeTitle)
                        
                        Text(fruit.name).font(.title)
                    }
                    Text(fruit.id)
                    })
                }.onDelete(perform: deletefruit)
            }.navigationTitle("FRUIT LIST")
        }.onAppear{
            getFruits()
        }
    }
    
    func getFruits(){
        let fruit1 = FruitModel(id: UUID().uuidString, count: 5, name: "orange")
        let fruit2 = FruitModel(id: UUID().uuidString, count: 7, name: "guava")
        let fruit3 = FruitModel(id: UUID().uuidString, count: 8, name: "watermelon")
        let fruit4 = FruitModel(id: UUID().uuidString, count: 21, name: "jack")
        
        fruitArray.append(fruit1)
        fruitArray.append(fruit2)
        fruitArray.append(fruit3)
        fruitArray.append(fruit4)
    }
    func deletefruit(indexSet: IndexSet){
        fruitArray.remove(atOffsets: indexSet)
        
    }
}

#Preview {
    ViewModelVC()
}
