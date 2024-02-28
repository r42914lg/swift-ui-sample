//
//  DetailedView.swift
//  swift-ui-sample
//
//  Created by Leonid Gomberg on 28.02.2024.
//

import SwiftUI

struct DetailedView: View {
    @ObservedObject var detailsVM: DetailsViewModel
    
    init(argDetId: String) {
        self.detailsVM = DetailsViewModel(detailId: argDetId)
    }
    
    var body: some View {
        Text(detailsVM.data)
    }
}
