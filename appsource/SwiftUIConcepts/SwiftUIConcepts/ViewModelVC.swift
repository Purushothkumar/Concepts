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


class FruitViewModel: ObservableObject  {
    @Published var fruitArray:[FruitModel] = [
        FruitModel(id: UUID().uuidString, count: 5, name: "APPLE"),
        FruitModel(id: UUID().uuidString, count: 10, name: "BANANA")]
//    @Published var fruitArray:[FruitModel] = []
    @Published var isLoading: Bool = false
    
    func getFruits(){
        let fruit1 = FruitModel(id: UUID().uuidString, count: 5, name: "orange")
        let fruit2 = FruitModel(id: UUID().uuidString, count: 7, name: "guava")
        let fruit3 = FruitModel(id: UUID().uuidString, count: 8, name: "watermelon")
        let fruit4 = FruitModel(id: UUID().uuidString, count: 21, name: "jack")
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.fruitArray.append(fruit4)
            self.isLoading = false
        }
    }
    func deletefruit(indexSet: IndexSet){
        fruitArray.remove(atOffsets: indexSet)
        
    }

}

struct ViewModelVC: View {
//    @State var fruitArray:[FruitModel] = [
//        FruitModel(id: UUID().uuidString, count: 5, name: "APPLE"),
//        FruitModel(id: UUID().uuidString, count: 10, name: "BANANA")]
    @ObservedObject var fruitViewModel:FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List{
                if fruitViewModel.isLoading{
                    ProgressView()
                }
                else{
                ForEach(fruitViewModel.fruitArray) { fruit in                  VStack(alignment: .leading, content: {
                    HStack{
                        Text("\(fruit.count)").foregroundColor(.blue).font(.largeTitle)
                        
                        Text(fruit.name).font(.title)
                    }
                    Text(fruit.id)
                    })
                }.onDelete(perform: fruitViewModel.deletefruit)
            }}.navigationTitle("FRUIT LIST")
        }.onAppear{
            fruitViewModel.getFruits()
        }
    }
    
}

#Preview {
    ViewModelVC()
}
