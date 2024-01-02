//
//  GesturesSessionView.swift
//  BluSwiftUI
//
//  Created by Alireza Asadi on 12/12/23.
//

import SwiftUI

struct GesturesSessionView: View {
    @State private var translation: CGSize = .zero

    var body: some View {
        Text("Hello, World!")
            .padding()
            .background {
                Color.green
            }
            .offset(translation)
            .gesture(dragGesture)
    }

    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                translation = value.translation
            }
            .onEnded { value in
                if value.translation.width < -100 {
                    withAnimation(.spring) {
                        translation = .init(width: -1000, height: 0)
                    }
                } else if value.translation.width > 100 {
                    withAnimation(.spring) {
                        translation = .init(width: 1000, height: 0)
                    }
                } else {
                    withAnimation(.spring) {
                        translation = .zero
                    }
                }
            }
    }
}

struct SwiftUIClassGesture: Gesture {
    var body: some Gesture {
        TapGesture()
            .sequenced(
                before: DragGesture()
            )
            .onEnded { _ in
                print("SequenceGesture onEnded")
            }
    }
}

struct ExpandableWithGestureView: View {
    struct Card: Identifiable {
        var id: String { title }
        var title: String
        var color: Color
    }

    var cards: [Card] = [
        Card(title: "Alireza Asadi", color: .orange),
        Card(title: "Mohsen Talaei", color: .yellow),
        Card(title: "Amin Torabi", color: .blue),
        Card(title: "Reza Akbari", color: .pink),
        Card(title: "Hosein Hajimirza", color: .gray),
    ]

    @State private var isExpanded: Bool = true
    @State private var translation: CGFloat = .zero

    var body: some View {
        VStack(spacing: (isExpanded ? 12 : -48) + translation / 10) {
            ForEach(cards) { card in
                Text(card.title)
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .background {
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(card.color)
                    }
                    .gesture(pinchGesture)
            }
            .padding(.horizontal)
        }
    }

    private var pinchGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                translation = value.translation.height
            }
            .onEnded { value in
                if value.predictedEndTranslation.height > 0 {
                    withAnimation(.spring) {
                        translation = .zero
                        isExpanded = true
                    }
                } else if value.predictedEndTranslation.height < 0 {
                    withAnimation(.spring) {
                        translation = .zero
                        isExpanded = false
                    }
                }
            }
    }
}

#Preview {
    GesturesSessionView()
}

#Preview {
    ExpandableWithGestureView()
}
