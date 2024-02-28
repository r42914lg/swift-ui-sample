//
//  DetailsViewModel.swift
//  swift-ui-sample
//
//  Created by Leonid Gomberg on 28.02.2024.
//

import RealmSwift

class DetailsViewModel: ObservableObject {
    private var detailId: String = ""
    @Published var data: String = "Loading..."
    
    init(detailId: String) {
        self.detailId = detailId
        fetchFromCache()
    }
    
    
    private func fetchFromCache() {
        let realm = try! Realm()
        if let catFactRealm = realm.objects(CatFactRealm.self).first(where: { $0.catId == detailId }) {
            data = "Cat ID = " + catFactRealm.catId + "\nFact = " + catFactRealm.catDesc
        } else {
            data = "Realm not found for id - " + detailId
        }
    }
}

