//
//  TransistionVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 09/07/24.
//

import SwiftUI

struct TransistionVC: View {
    @State var animated = false
    var body: some View {

        VStack{
            Button("Press me") {
                animated.toggle()
            }
            Spacer()
            if (animated){
//                RoundedRectangle(cornerRadius: 10)
//                    .fill( .green)
//                    .frame(width: UIScreen.main.bounds.width * 0.95, height: 100)
//                    .animation(.easeInOut)
//                    .transition(.slide)
//                Spacer()
//
//                RoundedRectangle(cornerRadius: 10)
//                    .fill( .green)
//                    .frame(width: UIScreen.main.bounds.width * 0.95, height: 100)
//                    .animation(.easeInOut)
//                    .transition(.move(edge: .bottom))
//                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill( .green)
                    .frame(width: UIScreen.main.bounds.width * 0.95, height: 100)
                    .animation(.easeInOut)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill( .green)
                    .frame(width: UIScreen.main.bounds.width * 0.95, height: 100)
                    .animation(.easeInOut)
                    .transition(.asymmetric(
                        insertion:.move(edge: .top) ,
                        removal: .move(edge: .bottom)))
                Spacer()
            }

        }
    }
}

#Preview {
    TransistionVC()
}
