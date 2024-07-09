//
//  IfelseVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 09/07/24.
//

import SwiftUI

struct IfelseVC: View {
    @State var toggleValue = false
    var body: some View {
        VStack{
            Button ("CircleView : \(toggleValue.description)"){
                toggleValue.toggle()
            }
            if toggleValue{
                Circle().frame(width: 100)
            }
        }


    }
}

#Preview {
    IfelseVC()
}
