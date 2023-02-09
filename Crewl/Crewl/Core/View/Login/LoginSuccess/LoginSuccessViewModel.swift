//
//  LoginSuccessViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import Foundation

typealias LoginSuccessRouterPromoter = LoginSuccessRouter

class LoginSuccessViewModel : ObservableObject {
    
    var router = LoginSuccessRouterPromoter()
    
    init(router: LoginSuccessRouterPromoter = LoginSuccessRouterPromoter()) {
        self.router = router
    }
    
}
