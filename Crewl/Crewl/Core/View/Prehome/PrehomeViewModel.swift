//
//  PrehomeViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation

typealias PrehomeRouterPromoter = PrehomeRouter

class PrehomeViewModel : ObservableObject {
    
    var router = PrehomeRouterPromoter()

    init(router: PrehomeRouterPromoter = PrehomeRouterPromoter()) {
        self.router = router

    }
}
