//
//  NavigationSessionView.swift
//  BluSwiftUI
//
//  Created by Alireza Asadi on 11/28/23.
//

import SwiftUI

struct Person: Hashable, Identifiable {
    var id: String { name }
    var name: String
    var age: Int
}

struct Pan: Hashable {
    var value: String
}

struct IBAN: Hashable {
    var value: String
}

struct NavigationSessionView: View {
    let people: [Person] = [
        Person(name: "Reza Akbari", age: 20),
        Person(name: "Alireza Asadi", age: 21),
        Person(name: "Arash Mousavi", age: 22),
        Person(name: "Behrouz", age: 23),
    ]

    @State private var title: String = "Nav Session"
    @State private var isPresented: Bool = false
    @State private var viewingPerson: Person?

    init(title: String = "Nav Session", isPresented: Bool = false, viewingPerson: Person? = nil) {
        self.title = title
        self.isPresented = isPresented
        self.viewingPerson = viewingPerson

//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red, .backgroundColor: UIColor.blue]
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(people, id: \.name) { person in
                    // SHEET
//                    Button {
//                        viewingPerson = person
//                    } label: {
//                        Text(person.name)
//                            .padding()
//                            .frame(maxWidth: .infinity, minHeight: 54, alignment: .leading)
//                    }

                    // Navigation
                    NavigationLink(value: person) {
                        Text(person.name)
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 54, alignment: .leading)
                    }
                }
            }
            .navigationTitle(Text(title))
            .toolbar(.hidden, for: .navigationBar)
            .toolbar {
                ToolbarItemGroup(placement: .status) {
                    Button("Edit Navigation Bar title", action: { isPresented = true })
                }

                ToolbarItemGroup {
                    Toggle("Toggle", isOn: $isPresented)
                        .toggleStyle(.switch)
                }
            }
            .sheet(item: $viewingPerson) { person in
                NavigationSessionInnerView(person: person)
            }
            .sheet(isPresented: $isPresented) {
                TextField("Navigation Bar Title", text: $title)
            }
            .navigationDestination(for: Person.self) { person in
                NavigationSessionInnerView(person: person)
            }
        }
    }
}

struct NavigationSessionInnerView: View {
    var person: Person

    var body: some View {
        NavigationStack {
            VStack {
                Text("Age: \(person.age)")

                NavigationLink("Again", value: person)
            }
            .navigationTitle(Text(person.name))
            .navigationDestination(for: Person.self) { person in
                NavigationSessionInnerView(person: person)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationSessionView()
}
