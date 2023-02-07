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
    
    @Published var activatedRegister : Bool
    @Published var activatedLogin : Bool
    
    init(router: PrehomeRouterPromoter = PrehomeRouterPromoter(), activatedRegister: Bool, activatedLogin: Bool) {
        self.router = router
        self.activatedRegister = activatedRegister
        self.activatedLogin = activatedLogin
    }
}
