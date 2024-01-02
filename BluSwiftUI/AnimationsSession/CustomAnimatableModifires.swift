//
//  ContentView.swift
//  SwiftUISessions
//
//  Created by Amin Torabi on 10/5/1402 AP.
//

import SwiftUI

struct CustomAnimatableModifiresView: View {
    @State private var progress: CGFloat = 0

       var body: some View {
           Circle()
               .frame(width: 20, height: 20)
//               .sineWaveMotion(amplitude: 50, frequency: 1, progress: progress)
               .curvedMotion(path: Path(), progress: progress)
               .onAppear {
                   withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                       progress = 3
                   }
               }
       }
}

import SwiftUI

struct CurvedMotionModifier: AnimatableModifier {
    var progress: CGFloat
    let path: Path

    // SwiftUI animates this property
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }

    func body(content: Content) -> some View {
        // Calculate the current point on the curve
        let point = quadraticBezierPoint(p: progress, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 300, y: 300), control: CGPoint(x: 150, y: 0))
        
        return content.position(point)
    }

    // Function to calculate the point on a quadratic bezier curve
    private func quadraticBezierPoint(p: CGFloat, start: CGPoint, end: CGPoint, control: CGPoint) -> CGPoint {
        let x = (1-p)*(1-p)*start.x + 2*(1-p)*p*control.x + p*p*end.x
        let y = (1-p)*(1-p)*start.y + 2*(1-p)*p*control.y + p*p*end.y
        return CGPoint(x: x, y: y)
    }
}

struct SineWaveMotionModifier: AnimatableModifier {
    var progress: CGFloat
    var amplitude: CGFloat = 50 // Height of the sine wave
    var frequency: CGFloat = 1 // How many waves in the view's width

    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }

    func body(content: Content) -> some View {
        let y = amplitude * sin(progress * 2 * .pi * frequency)
        return content.offset(x: progress, y: y)
    }
}

extension View {
    func sineWaveMotion(amplitude: CGFloat, frequency: CGFloat, progress: CGFloat) -> some View {
        self.modifier(SineWaveMotionModifier(progress: progress, amplitude: amplitude, frequency: frequency))
    }
}


extension View {
    func curvedMotion(path: Path, progress: CGFloat) -> some View {
        self.modifier(CurvedMotionModifier(progress: progress, path: path))
    }
}



#Preview {
    ContentView()
}

