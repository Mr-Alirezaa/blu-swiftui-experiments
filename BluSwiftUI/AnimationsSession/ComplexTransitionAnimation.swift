//
//  TransitionAnimation.swift
//  SwiftUISessions
//
//  Created by Amin Torabi on 10/12/1402 AP.
//

import SwiftUI

struct CardView: View {
    @State private var isFlipped = false

    var body: some View {
        VStack {
            if isFlipped {
                CardBackView()
                    .transition(.asymmetric(insertion: .flipFromLeft, removal: .flipFromRight))
            } else {
                CardFrontView()
                    .transition(.asymmetric(insertion: .flipFromRight, removal: .flipFromLeft))
            }
        }
        .frame(width: 200, height: 300)
        .onTapGesture {
            withAnimation {
                isFlipped.toggle()
            }
        }
    }

}

struct CardFrontView: View {
    var body: some View {
        ZStack {
            Color.blue
            Text("Front")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct CardBackView: View {
    var body: some View {
        ZStack {
            Color.green
            Text("Back")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

extension AnyTransition {
    static var flipFromLeft: AnyTransition {
        .asymmetric(
            insertion: .identity,
            removal: .modifier(
                active: FlipEffect(angle: 90, axis: (x: 0, y: 1)),
                identity: FlipEffect(angle: 0, axis: (x: 0, y: 1))
            )
        )
    }
    
    static var flipFromRight: AnyTransition {
        .asymmetric(
            insertion: .identity,
            removal: .modifier(
                active: FlipEffect(angle: -90, axis: (x: 0, y: 1)),
                identity: FlipEffect(angle: 0, axis: (x: 0, y: 1))
            )
        )
    }
}

struct FlipEffect: GeometryEffect {
    var angle: Double
    let axis: (x: CGFloat, y: CGFloat)
    
    var animatableData: Double {
        get { angle }
        set { angle = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        let radians = CGFloat(Angle(degrees: angle).radians)
        var transform3d = CATransform3DIdentity
        transform3d.m34 = -1 / max(size.width, size.height)
        
        transform3d = CATransform3DRotate(transform3d, radians, axis.x, axis.y, 0)
        return ProjectionTransform(transform3d)
    }
}


#Preview {
    CardView()
}
