//
//  LoginNumberViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation
import SwiftUI
import FirebaseAuth

typealias LoginNumberRouterPromoter = LoginNumberRouter

class LoginNumberViewModel : ObservableObject {
    lazy var countryList: [Country] = getCountries()
    
    var router = LoginNumberRouterPromoter()
    
    @Published var selectedCountryByUser : Country
    @Published var loginPropertys = LoginPropertys()

    // Booleans
    @Published var isCheckMarked : Bool
    @Published var isActivatePolicy : Bool
    @Published var isActivateTerms : Bool
    @Published var isPhoneCorrect : Bool
    @Published var isClickedCountryBottomSheet : Bool
    
    init(selectedCountryByUser: Country = MockData.defaultCountry,
         loginPropertys: LoginPropertys = LoginPropertys(),
         router: LoginNumberRouterPromoter = LoginNumberRouterPromoter(),
         isCheckMarked: Bool = false,
         isActivatePolicy: Bool = false,
         isActivateTerms: Bool = false,
         isPhoneCorrect : Bool = false,
         isClickedCountryBottomSheet : Bool = false
    )
    {
        self.selectedCountryByUser = selectedCountryByUser
        self.loginPropertys = loginPropertys
        self.router = router
        self.isCheckMarked = isCheckMarked
        self.isActivatePolicy = isActivatePolicy
        self.isActivateTerms = isActivateTerms
        self.isPhoneCorrect = isPhoneCorrect
        self.isClickedCountryBottomSheet = isClickedCountryBottomSheet
    }
    
    
}

// TODO: Change default country depends by local country of phone.
extension LoginNumberViewModel {
    struct MockData {
        static var defaultCountry = Country(name: "Turkey", dialogCode: "TR", countryCode: "+90", flag: "🇹🇷")
    }
}

