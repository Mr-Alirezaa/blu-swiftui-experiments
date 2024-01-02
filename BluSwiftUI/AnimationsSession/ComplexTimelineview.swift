//
//  ComplexTimelineview.swift
//  SwiftUISessions
//
//  Created by Amin Torabi on 10/12/1402 AP.
//

import SwiftUI

struct AnimatedProgressBarView: View {
    var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { context in
            ProgressBar(context: context)
        }
    }
}
struct ProgressBar: View {
    let context: TimelineViewDefaultContext
    let duration: TimeInterval = 5 // duration of the progress bar animation

    var body: some View {
        let progress = min((context.date.timeIntervalSinceReferenceDate.truncatingRemainder(dividingBy: duration)) / duration, 1)
        
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 200, height: 20)
                .opacity(0.3)
                .foregroundColor(.gray)

            Rectangle()
                .frame(width: 200 * CGFloat(progress), height: 20)
                .foregroundColor(.blue)
                .animation(.linear, value: progress)
        }
        .cornerRadius(10)
    }
}


import SwiftUI

struct AbstractAnimationView: View {
    var body: some View {
        TimelineView(.periodic(from: .now, by: 0.1)) { context in
            AnimatedShapes(context: context)
        }
        .frame(width: 300, height: 300, alignment: .center)
    }
}

struct AnimatedShapes: View {
    let context: TimelineViewDefaultContext

    var body: some View {
        let time = context.date.timeIntervalSinceReferenceDate
        let angle = sin(time) * Double.pi
        let scale = (cos(time) + 1) / 2
        let xOffset = cos(time) * 50
        let yOffset = sin(time) * 50

        ZStack {
            Circle()
                .fill(Color.blue.opacity(0.5))
                .frame(width: 100 * scale, height: 100 * scale)
                .offset(x: xOffset, y: yOffset)
                .rotationEffect(Angle(radians: angle))

            RoundedRectangle(cornerRadius: 25)
                .fill(Color.red.opacity(0.5))
                .frame(width: 80 * scale, height: 80 * scale)
                .offset(x: -xOffset, y: -yOffset)
                .rotationEffect(Angle(radians: -angle))
        }
    }
}


#Preview {
    AnimatedProgressBarView()
}

#Preview {
    AbstractAnimationView()
}
