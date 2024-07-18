//
//  ForEachBootcamp.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 08/07/24.
//

import SwiftUI

struct ForEachBootcamp: View {
    let data = ["hi","hello","hey everyone"]
    var body: some View {
        ScrollView{
            HStack {
                VStack{
                    ForEach(0..<30) { Index in
                        HStack{
                            Text("hi \(Index)")
                            Circle().frame(width:30, height: 30)
                        }
                    }
                }
                VStack{
                    ForEach(data.indices) { Index in
                        Text("Data at index \(Index) : \(data[Index])")
                    }
                }
            }
        }
    }
}

#Preview {
    ForEachBootcamp()
}



