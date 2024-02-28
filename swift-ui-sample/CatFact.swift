//
//  CatFact.swift
//  swift-ui-sample
//
//  Created by Leonid Gomberg on 28.02.2024.
//

import Foundation
import RealmSwift

struct CatFact : Decodable {
    var _id: String
    var text: String
}

class CatFactRealm : Object {
    @Persisted dynamic var catId: String = ""
    @Persisted dynamic var catDesc: String = ""
    
    override init() {}
    
    init(catId: String, catDesc: String) {
        self.catId = catId
        self.catDesc = catDesc
    }
}
