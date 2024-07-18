//
//  ScrollViewVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 08/07/24.
//

import SwiftUI

struct ScrollViewVC: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: true, content: {
            LazyVStack {
                ForEach(0..<50) { OuterIndex in
                    ScrollView(.horizontal,showsIndicators:false) {
                        LazyHStack{
                            ForEach(0..<5) { InnerIndex in
                                RoundedRectangle(cornerRadius: 10)
                                     .fill(Color.white)
                                     .frame(width: 200, height: 100)
                                     .shadow(radius: 3)
                                     .padding(4)
//                                print("InnerIndex is: \(InnerIndex)")
                            }
                        }
                    }
                }
            }
        })
    }
}

#Preview {
    ScrollViewVC()
}
