//
//  LoginNumberViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation
import FirebaseAuth

typealias LoginNumberRouterPromoter = LoginNumberRouter

class LoginNumberViewModel : ObservableObject {
    
    var router = LoginNumberRouterPromoter()
    
    @Published var loginPropertys = LoginPropertys()
    @Published var isCheckMarked : Bool
    @Published var isActivatePolicy : Bool
    @Published var isActivateTerms : Bool
    @Published var isPhoneCorrect : Bool
    
    
    init(loginPropertys: LoginPropertys = LoginPropertys(),
         router: LoginNumberRouterPromoter = LoginNumberRouterPromoter(),
         isCheckMarked: Bool = false,
         isActivatePolicy: Bool = false,
         isActivateTerms: Bool = false,
         focusState: Bool = false,
         isPhoneCorrect : Bool = false)
    {
        self.loginPropertys = loginPropertys
        self.router = router
        self.isCheckMarked = isCheckMarked
        self.isActivatePolicy = isActivatePolicy
        self.isActivateTerms = isActivateTerms
        self.isPhoneCorrect = isPhoneCorrect
    }
}
