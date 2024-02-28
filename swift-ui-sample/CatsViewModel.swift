//
//  CatsViewModel.swift
//  swift-ui-sample
//
//  Created by Leonid Gomberg on 28.02.2024.
//

import Foundation
import Alamofire
import RealmSwift

class CatsViewModel: ObservableObject {
    @Published var items: [CatFact] = [] {
        didSet {
            persistCache()
        }
    }
    
    func fetchData() {
        AF.request("https://cat-fact.herokuapp.com/facts").responseDecodable(of: [CatFact].self) { response in
            guard let items = response.value else {
                return
            }
            self.items = items
        }
    }
    
    func persistCache() {
        let realm = try! Realm()
        try! realm.write() {
            for cat in self.items {
                let newCatFactRealm = CatFactRealm(catId: cat._id, catDesc: cat.text)
                realm.add(newCatFactRealm)
            }
        }
    }
}
