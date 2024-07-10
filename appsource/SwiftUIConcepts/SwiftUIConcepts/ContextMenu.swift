//
//  ContextMenu.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 10/07/24.
//

import SwiftUI

struct ContextMenu: View {
    @State var backgroundColor = Color.blue
    var body: some View {
        VStack(alignment: .leading,spacing: 10.0) {
            Image(systemName: "house.fill").font(.largeTitle.bold()).foregroundColor(Color.yellow)
            Text("Name:Purushoth").font(.largeTitle.bold())
            Text("""
Address:
3/622 A Govindan nagar 6th Street
Palavakkam
Chennai - 600041
""").font(.title)

        }.foregroundColor(.white)
            .padding(30)
            .background(backgroundColor.cornerRadius(30))
    }
}

#Preview {
    ContextMenu()
}
