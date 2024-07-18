//
//  SliderVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 11/07/24.
//

import SwiftUI

struct SliderVC: View {
    @State var slidervalue:Double = 10.0
    @State var sliderColor:Color = .red

    var body: some View {
        VStack{
            Slider(value: $slidervalue,
                   in: 0...100,
                   step: 1.0

            )
        }
    }
}

#Preview {
    SliderVC()
}
