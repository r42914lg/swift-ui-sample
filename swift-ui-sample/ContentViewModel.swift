//
//  ContentViewModel.swift
//  swift-ui-sample
//
//  Created by Leonid Gomberg on 27.02.2024.
//

import Foundation

struct Item : Identifiable, Hashable {
    
    var id: String = UUID().uuidString
    var url: URL?
    
    init(_ url: URL?) {
        self.url = url
    }
    
}

final class ContentViewModel: ObservableObject {
    
    @Published var itemArray = [Item]( arrayLiteral: 
        Item(URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_from_Silesia2.jpg")),
        Item(URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg/1920px-Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg")),
        Item(URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Moscow_%2852078730783%29.jpg/1280px-Moscow_%2852078730783%29.jpg")),
        Item(URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_from_Silesia2.jpg")),
        Item(URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg/1920px-Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg")),
        Item(URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Moscow_%2852078730783%29.jpg/1280px-Moscow_%2852078730783%29.jpg")),
        Item(URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Moscow_%2852078730783%29.jpg/1280px-Moscow_%2852078730783%29.jpg")),
        Item(URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_from_Silesia2.jpg")),
        Item(URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg/1920px-Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg")),
        Item(URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Moscow_%2852078730783%29.jpg/1280px-Moscow_%2852078730783%29.jpg"))
    )

}
