//
//  TABVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 11/07/24.
//

import SwiftUI

struct TABVC: View {
    @State var selectedtab = 0
    @State var backgroundcolor = Color.blue

    var body: some View {

        ZStack{
            TabView(selection: $selectedtab,
                    content:  {

                ExtractedHomeView(selectedtab: $selectedtab, backgroundcolor: $backgroundcolor).tabItem {
                    VStack {
                        Text("Home")
                        Image(systemName: "house")
                    }
                }.tag(0)


                ExtractedProfileView(selectedtab: $selectedtab, backgroundcolor: $backgroundcolor).tabItem {
                    VStack {
                        Text("Profile")
                        Image(systemName: "person")
                    }
                }.tag(1)

                ExtractedMenuView(selectedtab: $selectedtab, backgroundcolor: $backgroundcolor).tabItem {
                    VStack {
                        Text("Menu")
                        Image(systemName: "line.3.horizontal")
                    }
                }.tag(2)
            }).accentColor(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)))
        }
    }
}

#Preview {
    TABVC()
}

struct ExtractedHomeView: View {
    @Binding var selectedtab: Int
    @Binding var backgroundcolor:Color
    var body: some View {
        ZStack {
            Color.blue
            Button(action: {
                backgroundcolor = .blue
                selectedtab = 1
            }, label: {
                Text("To Profile")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.blue)
                    .background(Color.white).cornerRadius(10)

            })
        }

    }
}

struct ExtractedProfileView: View {
    @Binding var selectedtab: Int
    @Binding var backgroundcolor:Color

    var body: some View {
        ZStack {
            Color.red
            Button(action: {
                backgroundcolor = .red
                selectedtab = 2
            }, label: {
                Text("To Menu")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.red)
                    .background(Color.white).cornerRadius(10)

            })
        }

    }
}
struct ExtractedMenuView: View {
    @Binding var selectedtab: Int
    @Binding var backgroundcolor:Color

    var body: some View {
        ZStack {
            Color.green
            Button(action: {
                backgroundcolor = .green
                selectedtab = 0
            }, label: {
                Text("To Home")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.green)
                    .background(Color.white).cornerRadius(10)

            })
        }
    }
}
