//
//  GeometryReaderSessionView.swift
//  BluSwiftUI
//
//  Created by Alireza Asadi on 1/9/24.
//

import SwiftUI

struct GeometryReaderSessionView: View {
    @State var isAbove: Bool = true

    var body: some View {
        GeometryReader { geometry in
//            let _ = print(geometry.size)
//            let _ = print(geometry.frame(in: .local))
//            let _ = print(geometry.frame(in: .global))
//            let _ = print(geometry.safeAreaInsets)

            let frame = geometry.frame(in: .local)

            Text("Hello, World!")
                .padding(32)
                .background(Color.orange, in: RoundedRectangle(cornerRadius: 16))
                .position(x: frame.midX, y: frame.midY)
                .scaleEffect(isAbove ? 1 : 0.8)
                .zIndex(isAbove ? 1 : 0)

            Text("Good bye, World!")
                .padding(32)
                .background(Color.mint, in: RoundedRectangle(cornerRadius: 16))
                .position(x: frame.midX, y: frame.midY + 40)
                .scaleEffect(isAbove ? 0.8 : 1)
                .zIndex(isAbove ? 0 : 1)
                .onTapGesture {
                    withAnimation {
                        isAbove.toggle()
                    }
                }
        }
    }
}

struct ScrollViewOffsetView: View {
    @State private var scrollViewOffset: CGFloat = 0

    var body: some View {
        ScrollView {
            // Invisible GeometryReader to calculate the offset
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        updateOffset(with: geometry)
                    }
                    .onChange(of: geometry.frame(in: .global).minY) { _, _ in
                        updateOffset(with: geometry)
                    }
            }
            .frame(height: 0)

            // Your scrollable content
            VStack {
                ForEach(0..<50) { index in
                    Text("Item \(index)")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .padding(.vertical, 4)
                }
            }
        }
    }

    private func updateOffset(with geometry: GeometryProxy) {
        // Update the scroll view offset
        scrollViewOffset = geometry.frame(in: .global).minY
        // You can use scrollViewOffset as needed
        print("ScrollView Offset: \(scrollViewOffset)")
    }
}

struct GeometryReaderSessionTrickView: View {
    var body: some View {
        Text("Hello, World!")
            .padding(32)
            .frame(maxWidth: .infinity)
            .background(Color.orange.opacity(0.8), in: Rectangle())
            .background {
                GeometryReader { geometry in
                    let frame = geometry.frame(in: .global)
                    let _ = print("frame:", frame)
                    Text("Gooooooogoooli")
                }
            }

//        ViewThatFits {
//            let date = Date()
//            VStack {
//                Text(date.formatted(date: .long, time: .complete))
//                Text(date.formatted(date: .abbreviated, time: .omitted))
//            }
//
//            Text(date.formatted(date: .abbreviated, time: .omitted))
//        }
//        .frame(width: 100)
    }
}


#Preview {
    GeometryReaderSessionView()
}

#Preview {
    ScrollViewOffsetView()
}

#Preview {
    GeometryReaderSessionTrickView()
}
