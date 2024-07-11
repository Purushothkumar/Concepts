//
//  StepperVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 11/07/24.
//

import SwiftUI

struct StepperVC: View {

    @State var value = 10
    @State var widthvalue:CGFloat = 0


    var body: some View {
        VStack{
            Stepper("Stepper: \(value)", value: $value)

            RoundedRectangle(cornerRadius: 10.0).frame(width: 100 + widthvalue, height:100)
            Stepper("Stepper: \(value)") {
                changevalue(change: 10)
            } onDecrement: {
                changevalue(change: -10)

            }

        }.padding()


    }
    func changevalue(change:CGFloat){
            withAnimation(.easeIn) {
                widthvalue += change
            
        }
    }
}

#Preview {
    StepperVC()
}
