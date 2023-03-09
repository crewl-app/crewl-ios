//
//  NotiLocationViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

typealias NotiLocationViewModelRouterPromoter = NotiLocationRouter

class NotiLocationViewModel: ObservableObject {
    
    @Published var isSkipView: Bool
    var router = NotiLocationViewModelRouterPromoter()
    
    init(isSkipView: Bool = false,
         router: NotiLocationViewModelRouterPromoter = NotiLocationViewModelRouterPromoter()) {
        self.isSkipView = isSkipView
        self.router = router
    }
}
