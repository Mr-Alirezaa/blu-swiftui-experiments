//
//  SimpleAnimatableModifire.swift
//  SwiftUISessions
//
//  Created by Amin Torabi on 10/12/1402 AP.
//

import SwiftUI

struct NumberView: AnimatableModifier {
    var number: Int

    var animatableData: CGFloat {
        get { CGFloat(number) }
        set { number = Int(newValue) }
    }

    func body(content: Content) -> some View {
        Text(String(number))
        let _ = print(number)
    }
}

struct NumberViewExample: View {
    @State private var number = 0

    var body: some View {
        VStack {
            Text(String(number))
                .modifier(NumberView(number: number))

            Button("Animate") {
                withAnimation(Animation.easeInOut(duration: 2)) {
                    number = 100
                }
            }
        }
    }
}
#Preview {
    NumberViewExample()
}

