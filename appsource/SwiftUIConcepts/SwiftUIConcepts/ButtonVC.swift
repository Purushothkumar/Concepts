//
//  ButtonVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 08/07/24.
//

import SwiftUI

struct ButtonVC: View {
    @State var title = "button pressed"
    var body: some View {
        Button("press me") {
            self.title = "new"
        }
    }
}

#Preview {
    ButtonVC()
}
