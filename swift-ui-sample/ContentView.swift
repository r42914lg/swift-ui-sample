//
//  ContentView.swift
//  swift-ui-sample
//
//  Created by Leonid Gomberg on 24.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showingBsd = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ListView()) {
                    Text("Button title")
                }
                NavigationLink(destination: BannersView()) {
                    Text("Gallery screen")
                }
                Button("Bottom sheet") {
                    showingBsd.toggle()
                }
                .sheet(isPresented: $showingBsd) {
                    Text("Bottom sheet in swift UI )))")
                        .presentationDetents([.medium, .large])
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
