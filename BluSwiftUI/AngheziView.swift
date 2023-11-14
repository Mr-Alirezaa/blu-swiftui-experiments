//
//  AngheziView.swift
//  BluSwiftUI
//
//  Created by Alireza Asadi on 11/14/23.
//

import SwiftUI

struct Coordinate {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

struct AngheziView: View {
    @State private var coordinate: Coordinate = .init(x: 0, y: 0)
    @State private var name: String = ""
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            Text("X: \(coordinate.x), Y: \(coordinate.y)")
            Text("X: \(coordinate.x)")
            Text("Name: \(name), \(String(describing: type(of: _coordinate)))")
            
            let binding = Binding {
                name
            } set: { newValue in
                name = newValue
            }

            TextField("Name", text: binding)
                .padding()
            
            Button {
                coordinate.x += 1
                DispatchQueue.main.asyncAfter(deadline: .now() + .microseconds(250)) {
                    self.coordinate.y += 10
                }
//                isOn = .random()
                
            } label: {
                Text("+1")
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            AgreementSwitch(isOn: $isOn)
        }
    }
}

struct AgreementSwitch: View {
    @Binding var isOn: Bool
    
    // @State
    // @Binding
    
    // @StateObject
    // @EnvironmentObject
    // @ObservedObject
    
    // @Environment
    
    // @FocusState
    
    // XXXX: DynamicProperty
    
    
    init(isOn: Binding<Bool>) {
        self._isOn = isOn
    }
    
    var body: some View {
        HStack {
            Text("Agreement Agreement Agreement Agreement Agreement Agreement Agreement Agreement Agreement ")
            
            Spacer()
            
            Toggle(isOn: $isOn, label: {
                EmptyView()
            })
        }
    }
}

#Preview {
    struct Helper: View {
        @State var isOn: Bool = false
        
        var body: some View {
            AngheziView()
        }
    }
    
    return Helper()
}
