//
//  ContentView.swift
//  swift-ui-sample
//
//  Created by Leonid Gomberg on 24.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ListView()) {
                    Text("Button title")
                }
                NavigationLink(destination: ListView()) {
                    Text("Gallery screen")
                }
                NavigationLink(destination: ListView()) {
                    Text("Bottom sheet")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
