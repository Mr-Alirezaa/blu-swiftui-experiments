//
//  Default.swift
//  SwiftUISessions
//
//  Created by Amin Torabi on 10/12/1402 AP.
//

import SwiftUI

struct Default: View {
    @State private var scale: CGFloat = 1
    var body: some View {
        Image(systemName: "star.fill")
            .scaleEffect(scale)
            .onTapGesture {
                withAnimation {
                    scale += 1

                }
            }
            
//            .animation(.default, value: scale)
//            .animation(.spring(), value: scale)
//            .animation(.interpolatingSpring(mass: 0.5, stiffness: 10, damping: 1, initialVelocity: 0), value: scale)

    }
}

#Preview {
    Default()
}
