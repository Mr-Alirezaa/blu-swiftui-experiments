//
//  CommonMistakeView.swift
//  SwiftUISessions
//
//  Created by Amin Torabi on 10/12/1402 AP.
//

import SwiftUI

struct CommonMistakeView: View {
    
    @State private var isZoomed = false
    
    var body: some View {
        VStack {
            if isZoomed {
                Circle()
                    .frame(width: 100, height: 100)
                    .offset(x: 0)
                    .animation(.default, value: isZoomed)
            } else {
                Circle()
                    .frame(width: 200, height: 200)
                    .offset(x: 0)
                    .animation(.default, value: isZoomed)
            }
        }
        .onTapGesture {
            withAnimation {
                isZoomed.toggle()
            }
        }
    }
    
}

#Preview {
    CommonMistakeView()
}
