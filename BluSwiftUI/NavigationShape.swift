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

struct CloudShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let r1: CGFloat = rect.height / 4
            let r2: CGFloat = rect.height / 3
            let r3: CGFloat = rect.height / 2
            let r4: CGFloat = rect.height / 6

            let c1: CGPoint = .init(x: rect.minX + r1, y: rect.maxY - r1)
            let c2: CGPoint = .init(x: rect.maxX - r2, y: rect.maxY - r2)
            let c3: CGPoint = .init(x: rect.midX * 1.1, y: rect.maxY - r3)
            let c4: CGPoint = .init(x: rect.minX + 2 * r1, y: rect.maxY - r3)

            // 1
            let p1 = Path { path in
                path.addArc(
                    center: c1,
                    radius: r1,
                    startAngle: .zero,
                    endAngle: .degrees(360),
                    clockwise: true
                )
            }

            // 2
            let p2 = Path { path in
                path.addArc(
                    center: c2,
                    radius: r2,
                    startAngle: .zero,
                    endAngle: .degrees(360),
                    clockwise: true
                )
            }

            // 3
            let p3 = Path { path in
                path.addArc(
                    center: c3,
                    radius: r3,
                    startAngle: .zero,
                    endAngle: .degrees(360),
                    clockwise: true
                )
            }

            // 4
            let p4 = Path { path in
                path.addArc(
                    center: c4,
                    radius: r4,
                    startAngle: .zero,
                    endAngle: .degrees(360),
                    clockwise: true
                )
            }

            // Empty area
            let p5 = Path { path in
                // Wrong way:
                // path.addRect(CGRect(origin: c1, size: .init(width: c2.x - c1.x, height: r1)))
                path.move(to: c1)
                path.addLine(to: c4)
                path.addLine(to: c3)
                path.addLine(to: c2)
                path.addLine(to: .init(x: c2.x, y: rect.maxY))
                path.addLine(to: .init(x: c1.x, y: rect.maxY))
                path.closeSubpath()
            }

//            path.addPath(p1)
//            path.addPath(p2)
//            path.addPath(p3)
//            path.addPath(p4)
//            path.addPath(p5)

            path = path
                .union(p1)
                .union(p2)
                .union(p3)
                .union(p4)
                .union(p5)

        }
    }
}


#Preview {
    struct Helper: View {
        var body: some View {
            CloudShape()
                .stroke(Color.red, lineWidth: 1.0)
//                .fill(Color.blue.gradient)
                .frame(width: 230, height: 150, alignment: .center)
                .padding(4)
                .border(.gray.opacity(0.5))
        }
    }

    return Helper()
}
