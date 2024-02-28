//
//  ListView.swift
//  swift-ui-sample
//
//  Created by Leonid Gomberg on 24.02.2024.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var catsVM = CatsViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach($catsVM.items , id: \._id) { $item in
                    NavigationLink(destination: DetailedView(argDetId: item._id)) {
                        Text(item._id.dropLast(10))
                            .id(item._id)
                            .padding(30)
                        }
                    }
                }
            .padding()
        }
    }
}

#Preview {
    ListView()
}
