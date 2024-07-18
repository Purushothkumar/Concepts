//
//  GridViewVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 08/07/24.
//

import SwiftUI

struct GridViewVC: View {
    let columns:[GridItem] = [
        GridItem(.flexible(), spacing: 5 , alignment: nil),
        GridItem(.flexible(), spacing: 5 , alignment: nil),
        GridItem(.flexible(), spacing: 5 , alignment: nil),
        GridItem(.flexible(), spacing: 5 , alignment: nil),
    ]
    var body: some View {
        LazyVGrid(columns: columns,
                  alignment: .center,
                  spacing: 0,
                  pinnedViews: []) {
            Section (header: Text("Section 1")
                .foregroundColor(.white)
                .font(.title2)
                .frame(maxWidth: .infinity,alignment: .center)
                .background(Color.red)
                .padding(),
                     content: {
                ForEach(0..<10) { Index in
                    Rectangle().frame(height: 100)
                }
            })
        }
    }
}

#Preview {
    GridViewVC()
}
