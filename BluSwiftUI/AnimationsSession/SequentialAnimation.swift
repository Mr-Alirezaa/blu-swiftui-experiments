//
//  SequentialAnimation.swift
//  SwiftUISessions
//
//  Created by Amin Torabi on 10/12/1402 AP.
//

import SwiftUI

struct SequentialAnimation: View {
    @State private var moveCircle = false
    @State private var fadeCircle = false
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundColor(.blue)
            .offset(x: moveCircle ? 100 : 0, y: 0)
            .opacity(fadeCircle ? 0 : 1)
            .onTapGesture {
                withAnimation(
                    .easeInOut(duration: 2)
//                    .repeatForever(autoreverses: true)
                ) {
                    moveCircle = true
                } completion: {
                    withAnimation(.easeInOut(duration: 2)) {
                        fadeCircle = true
                    }
                }
                
            }
    }
}

#Preview {
    SequentialAnimation()
}
