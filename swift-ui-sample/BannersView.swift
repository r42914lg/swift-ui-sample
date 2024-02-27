//
//  BannersView.swift
//  swift-ui-sample
//
//  Created by Leonid Gomberg on 25.02.2024.
//

import SwiftUI

struct BannersView: View {
    
    @ObservedObject var contentVM = ContentViewModel()
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    var body: some View {
        ScrollViewReader { pageScroller in
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach($contentVM.itemArray , id: \.id) { $item in
                        AsyncImage(
                            url: item.url,
                            content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 300, maxHeight: 100)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        .id(item.id)
                    }
                    .onAppear {
                        scrollProxy = pageScroller
                    }
                }
            }
            .onAppear {
                Task { @MainActor in
                    var i = 0
                    while i < $contentVM.itemArray.count {
                        try await Task.sleep(for: .seconds(2))
                        withAnimation {
                            scrollProxy?.scrollTo($contentVM.itemArray[i].id, anchor: .center)
                        }
                        i += 1
                    }
                }
            }
        }
    }
}

#Preview {
    BannersView()
}
