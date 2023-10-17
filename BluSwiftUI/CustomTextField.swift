//
//  CustomTextField.swift
//  BluSwiftUI
//
//  Created by Alireza Asadi on 10/17/23.
//

import Foundation
import SwiftUI
import RegexBuilder

//let regex = Regex {
//    Regex {
//        Capture {
//            ChoiceOf {
//                "CREDIT"
//                "DEBIT"
//            }
//        }
//        OneOrMore(.whitespace)
//        Capture {
//            Regex {
//                Repeat(1...2) {
//                    One(.digit)
//                }
//                "/"
//                Repeat(1...2) {
//                    One(.digit)
//                }
//                "/"
//                Repeat(count: 4) {
//                    One(.digit)
//                }
//            }
//        }
//    }
//
//}

@ViewBuilder func someFunc() -> some View /*(ViewBuilder<_ConditionalView<Text, Image>>)*/ {
    if true {
        Text("Alireza")
    } else {
        Image(systemName: "xmark")
    }

    // ViewBuilder<_ConditionalView<Text, Image>>
}

struct CustomTextField<Accessory: View>: View {
    let accessory: Accessory

    init(@ViewBuilder accessory: () -> Accessory) {
        self.accessory = accessory()
    }

    var body: some View {
        VStack {
            let _ = print(type(of: headerView))


//            _ConditionalContent(condition: true, viewIfTrue: Text("Alireza"), viewIfFalse: Image("xmark")) ->
            if true {
                Text("")
            } else {
                Image("")
            }

            // -> _ConditionalContent<Text, Image>: View
        }
        HStack {
            Text("Textfield:")
            accessory

            Image(systemName: "flame")

            Toggle(isOn: .constant(true), label: {
                Text("Toggle")
            })
        }
    }

    @ViewBuilder var headerView: some View {
        if Bool.random() {
            HStack {
                if true {
                    Text("Placeholder")
                } else {
                    Image("")
                }
            }
        }

        Text("")

        // HStack<_ConditionalContent<Text, Image>>

        // TupleView<(HStack<_ConditionalContent<Text, Image>>?, Text)>

//        TupleView(_condi, text)

//        AnyView
    }
}

#Preview {
    CustomTextField {
//        Image(systemName: "circle")
        Text("Agha Reza")
    }
}
