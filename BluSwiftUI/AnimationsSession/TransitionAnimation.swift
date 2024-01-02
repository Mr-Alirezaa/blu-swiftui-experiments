//
//  TransitionAnimation.swift
//  SwiftUISessions
//
//  Created by Amin Torabi on 10/12/1402 AP.
//

import SwiftUI

import SwiftUI

struct SimpleComplexTransitionView: View {
    @State private var isViewVisible = false

    var body: some View {
        VStack {
            Button("Toggle View") {
                withAnimation {
                    isViewVisible.toggle()
                }
            }

            if isViewVisible {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 200, height: 100)
                    .transition(.flipFromLeft)
//                    .transition(.slideAndFade)
//                    .transition(.flipFromLeft)
            }
        }
    }

}

extension AnyTransition {
    static var slideAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}


#Preview {
    SimpleComplexTransitionView()
}
