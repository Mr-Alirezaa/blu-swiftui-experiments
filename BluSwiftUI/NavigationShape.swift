//
//  NavigationShape.swift
//  BluSwiftUI
//
//  Created by Alireza Asadi on 10/31/23.
//

import SwiftUI

struct NavigationIconShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .init(x: rect.midX, y: rect.minY))
            path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
            path.move(to: .init(x: rect.maxX - 10, y: rect.maxY))
            path.addLine(to: .init(x: rect.midX, y: rect.midY))
            path.addLine(to: .init(x: rect.minX, y: rect.maxY))
            path.addLine(to: .init(x: rect.midX, y: rect.minY))
            path.closeSubpath()
        }
    }
}

struct PinShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in

        }
    }
}


#Preview {
    struct Helper: View {
        var body: some View {
            NavigationIconShape()
                .stroke(lineWidth: 1.0)
                .padding(40)
        }
    }

    return Helper()
}
