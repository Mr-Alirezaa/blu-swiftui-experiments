//
//  TimelineView.swift
//  SwiftUISessions
//
//  Created by Amin Torabi on 10/12/1402 AP.
//

import SwiftUI

import SwiftUI

struct ClockView: View {
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { context in
            let now = context.date
            Text("\(now, formatter: Self.dateFormatter)")
                .font(.largeTitle)
                .padding()
        }
    }
}

extension ClockView {
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
}


#Preview {
    ClockView()
}
