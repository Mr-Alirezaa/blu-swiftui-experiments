//
//  ContentView.swift
//  BluSwiftUI
//
//  Created by Alireza Asadi on 5/23/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    enum Field: Hashable {
        case username
        case password
    }

    @State private var username: String = ""
    @State private var password: String = ""

    @FocusState private var field: Field?

    var body: some View {
        VStack {
            HStack {
                Text("A great and warm welcome to Kuchi")
                    .background(Color.red)

                Text("A great and warm welcome to Kuchi")
                    .background(Color.red)
            }
            .background(Color.yellow)

//            Text("A great and warm welcome to Kuchi")
//                .frame(width: 393.0 / 2, alignment: .center)
//
//            Text("A great and warn welcome to Kuchi")
//                .frame(width: 393.0 / 2, alignment: .center)

        }
    }
}

struct PaddingModifier: ViewModifier {
    enum Preset: CGFloat {
        case regular = 16
        case wide = 32
    }

    private let preset: Preset

    init(preset: Preset) {
        self.preset = preset
    }

    func body(content: Content) -> some View {
        content
            .padding(16)
            .background {
                Color.gray.opacity(0.2)
            }
            .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
    }
}

extension TextField {
    func paddingPreset(_ preset: PaddingModifier.Preset) -> some View {
        self
            .modifier(PaddingModifier(preset: preset))
    }
}

struct BluFormTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        return configuration
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 1)
            }
    }
}

extension TextFieldStyle where Self == BluFormTextFieldStyle {
    static var blu: BluFormTextFieldStyle {
        BluFormTextFieldStyle()
    }
}

struct AppTitleView: View {
    var body: some View {
        HStack {
            Text(verbatim: "**Hello**")
            Text(", World!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
