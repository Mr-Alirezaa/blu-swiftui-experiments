//
//  ViewModelSessionView.swift
//  BluSwiftUI
//
//  Created by Alireza Asadi on 11/21/23.
//

import SwiftUI

class Session7ViewModel: ObservableObject {
    @Published var age: Int = 18
    @Published var isOn: Bool = false

    func makeMeOlder() {
        age += 10
    }
}

struct Session7View: View {
    @StateObject var viewModel1: Session7ViewModel = Session7ViewModel()
    @StateObject var viewModel2: Session7ViewModel = Session7ViewModel()

    // @EnvironmentObject
    // @StateObject
    // @ObservedObject

    var body: some View {
        VStack {
            HoseinKhajeamiriView()
                .environmentObject(viewModel2)

            Text("VM1: I'm \(viewModel1.age) years old!")
            Text("VM2: I'm \(viewModel2.age) years old!")
            Button("+1") {
                viewModel1.age += 1
                print(viewModel1.age)
            }
            .buttonStyle(.borderedProminent)

            Toggle(isOn: $viewModel1.isOn) {
                Text("Toggle")
            }
        }
        .padding()
        .environmentObject(viewModel1)
    }
}

struct HoseinKhajeamiriView: View {
    @EnvironmentObject private var viewModel: Session7ViewModel

    var body: some View {
        Text("HoseinKhajeamiriView: I'm \(viewModel.age) years old!")
        Button("+10") {
            viewModel.makeMeOlder()
            print(viewModel.age)
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    Session7View()
}
