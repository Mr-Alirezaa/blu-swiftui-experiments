//
//  MachedGeometryEffect.swift
//  SwiftUISessions
//
//  Created by Amin Torabi on 10/9/1402 AP.
//

import SwiftUI

import SwiftUI

struct MatchedGeometryExampleView: View {
    @Namespace private var animationNamespace
    @State private var isZoomed = false

    var body: some View {
        if isZoomed {
            // Detail View
            RoundedRectangle(cornerRadius: 10)
                .matchedGeometryEffect(id: "circle", in: animationNamespace)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    withAnimation {
                        isZoomed.toggle()
                    }
                }
        } else {
            // List View
            HStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .matchedGeometryEffect(id: "circle", in: animationNamespace)
                    .frame(width: 50, height: 50)
                Text("Tap to Zoom")
                Spacer()
            }
            .frame(height: 50)
            .padding()
            .onTapGesture {
                withAnimation {
                    isZoomed.toggle()
                }
            }
        }
    }
}


#Preview {
    MatchedGeometryExampleView()
}
