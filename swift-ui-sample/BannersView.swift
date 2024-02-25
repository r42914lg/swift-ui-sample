//
//  BannersView.swift
//  swift-ui-sample
//
//  Created by Leonid Gomberg on 25.02.2024.
//

import SwiftUI

struct Item : Hashable {
    
    var id: Int
    var url: URL
    
    init(_ id: Int, url: URL) {
        self.id = id
        self.url = url
    }
    
}

let items: [Item] = [
    Item(0, url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_from_Silesia2.jpg")!),
    Item(1, url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg/1920px-Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg")!),
    Item(2, url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Moscow_%2852078730783%29.jpg/1280px-Moscow_%2852078730783%29.jpg")!),
    Item(3, url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_from_Silesia2.jpg")!),
    Item(4, url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg/1920px-Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg")!),
    Item(5, url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Moscow_%2852078730783%29.jpg/1280px-Moscow_%2852078730783%29.jpg")!),
    Item(6, url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Moscow_%2852078730783%29.jpg/1280px-Moscow_%2852078730783%29.jpg")!),
    Item(7, url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_from_Silesia2.jpg")!),
    Item(8, url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg/1920px-Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg")!),
    Item(9, url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Moscow_%2852078730783%29.jpg/1280px-Moscow_%2852078730783%29.jpg")!)
]

struct BannersView: View {
    
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    var body: some View {
        ScrollViewReader { pageScroller in
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(items , id: \.self) { item in
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
                withAnimation {
                    scrollProxy?.scrollTo(items[6].id, anchor: .center)
                }
            }
        }
    }
}

#Preview {
    BannersView()
}
