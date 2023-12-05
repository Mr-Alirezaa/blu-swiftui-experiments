//
//  IterationThroughDataSessionView.swift
//  BluSwiftUI
//
//  Created by Alireza Asadi on 12/5/23.
//

import SwiftUI

struct ColorModel {
    var name: String
    var color: Color
    var components: [Int]
}

struct IterationThroughDataSessionView: View {
    var colors: [ColorModel] = [
        .init(name: "red", color: .red, components: Array(3...5)),
        .init(name: "blue", color: .blue, components: Array(6...11)),
        .init(name: "green", color: .green, components: Array(12...13)),
        .init(name: "orange", color: .orange, components: Array(14...16)),
        .init(name: "yellow", color: .yellow, components: Array(17...19)),
    ]

    @State private var isExpanded: Bool = true

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: nil, pinnedViews: .sectionHeaders) {
                ForEach(colors, id: \.name) { colorItem in
                    Section {
                        ForEach(colorItem.components, id: \.self) { comp in
                            Text("Comp: \(comp)")
                        }
                    } header: {
                        Text("Color: \(colorItem.name)")
                    }
                }
            }
        }
//        List {} -> ScrollView { VStack {} }
    }
}

struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?

    // some example websites
    static let apple = Bookmark(name: "Apple", icon: "1.circle")
    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
    static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
    static let twitter = Bookmark(name: "Twitter", icon: "mic")

    // some example groups
    static let example1 = Bookmark(name: "Favorites", icon: "star", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
}

struct ChildrenExampleView: View {
    let items: [Bookmark] = [.example1, .example2, .example3]

    var body: some View {
        List(items, children: \.items) { row in
            HStack {
                Image(systemName: row.icon)
                Text(row.name)
            }
        }
    }
}

struct DisclosureGroupExampleView: View {
    var body: some View {
        List {
            DisclosureGroup {
                Text("Also get avocados")
                Text("Also get avocados")
                Text("Also get avocados")
                Text("Also get avocados")

                DisclosureGroup {
                    Text("Also get avocados")
                    Text("Also get avocados")
                    Text("Also get avocados")
                    Text("Also get avocados")
                } label: {
                    Text("Grab a cucumber and limes from Whole Foods")
                }

            } label: {
                Text("Grab a cucumber and limes from Whole Foods")
            }

            Text("Buy Justin a gift for his 6th birthday")
            Text("Tattoo consultation")
        }
    }
}


#Preview {
    IterationThroughDataSessionView()
}

#Preview {
    ChildrenExampleView()
}

#Preview {
    DisclosureGroupExampleView()
}
