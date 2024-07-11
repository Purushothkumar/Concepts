//
//  DatePickerVC.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 11/07/24.
//

import SwiftUI

struct DatePickerVC: View {
    @State var selecteddate = Date()
    let startingdate = Calendar.current.date(from:DateComponents(year: 2000)) ?? Date()
    let endingDate = Date()

    var dateformatter:DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }

    var body: some View {

        VStack{
            Text(dateformatter.string(from: selecteddate))

            Spacer()
            Text("compact").font(.largeTitle)

            DatePicker("select date", selection: $selecteddate).datePickerStyle(.compact)

            Text("graphical").font(.largeTitle)

            DatePicker("select date", selection: $selecteddate).datePickerStyle(.graphical)

            DatePicker("select date",selection: $selecteddate, in: startingdate...endingDate,displayedComponents:[.hourAndMinute]).accentColor(.red)
            Spacer()

        }.padding()

    }
}

#Preview {
    DatePickerVC()
}
