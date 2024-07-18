//
//  ContextMenu.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 10/07/24.
//

import SwiftUI

struct ContextMenu: View {
    @State var backgroundColor = Color.blue
    @State var address = """
Address:
3/622 A Govindan nagar 6th Street
Palavakkam
Chennai - 600041
"""
    @State var name = "Purushoth"

    var body: some View {
        VStack(alignment: .leading,spacing: 10.0) {
            Image(systemName: "house.fill").font(.largeTitle.bold()).foregroundColor(Color.yellow)
            Text(name).font(.largeTitle.bold())
            Text(address).font(.title)

        }.foregroundColor(.white)
            .padding(30)
            .background(backgroundColor.cornerRadius(30))
            .contextMenu(menuItems: {
                Button(action: {backgroundColor = .purple}, label: {
                    Label("Home color", systemImage: "house").font(.largeTitle)
                })
                Button(action: {
                    backgroundColor = .red
                    name = "PK"
                }, label: {
                    Label("Name", systemImage: "person").font(.largeTitle)
                })
                Button(action: {
                    backgroundColor = .green
                    address = """
                Address:
                17 Sardar patel road
                Kanathur Reddykuppam
                Chennai - 600041
                """
               }, label: {
                    Label("Address", systemImage: "location").font(.largeTitle)
                })
                Button(action: {backgroundColor = Color.blue
                    address = """
                Address:
                3/622 A Govindan nagar 6th Street
                Palavakkam
                Chennai - 600041
                """
                name = "Purushoth"}, label: {                    Label("revert", systemImage: "arrowshape.turn.up.backward").font(.largeTitle)
                })

            })
    }
}

#Preview {
    ContextMenu()
}
