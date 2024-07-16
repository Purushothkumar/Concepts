//
//  AppStorageVC.swift
//  SwiftUIConcepts
//
//  Created by Purushothkumar on 16/07/24.
//

import SwiftUI

struct AppStorageVC: View {
//    @State var currentUserName: String?
@AppStorage("name") var currentUserName: String?

    var body: some View {
        VStack(spacing:20) {
            Text(currentUserName ?? "No Name")
            
            if let name = currentUserName {
                Text(name)
            }
            
            Button("Save") {
                currentUserName = "Purushoth"
                
//                UserDefaults.standard.setValue(currentUserName, forKey: "name")
                
            }
        }.onAppear{
//            currentUserName = UserDefaults.standard.string(forKey: "name")
        }
    }
}

#Preview {
    AppStorageVC()
}
