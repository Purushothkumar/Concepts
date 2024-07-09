//
//  AnimationVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 09/07/24.
//

import SwiftUI

struct AnimationVC: View {
    @State var animated = false
    var body: some View {

        VStack{
            Button("Press me") {
                withAnimation {
                    animated.toggle()
                }
            }
            Spacer()

            Button("2 sec delay") {
                withAnimation(Animation.default.delay(2)){
                    animated.toggle()
                }
            }       
            Spacer()
            Button("5 times repeat") {
                withAnimation(Animation.default.repeatCount(5, autoreverses: true)){
                    animated.toggle()
                }
            }
            Spacer()
            RoundedRectangle(cornerRadius: animated ? 50 : 100)
                .fill(animated ? .blue : .green)
                .frame(width: animated ? 100 : 300, height: animated ? 100 : 300)
                .rotationEffect(Angle(degrees: animated ? 45 : 0))
                .offset(y: animated ? 50 : 0)
            Spacer()

        }
    }
}

#Preview {
    AnimationVC()
}
