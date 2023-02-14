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
    
    @Published var verifectionID : String
    
    // Booleans
    @Published var isCheckMarked : Bool
    @Published var isActivatePolicy : Bool
    @Published var isActivateTerms : Bool
    @Published var isPhoneCorrect : Bool
    @Published var isFocusState : Bool
    @Published var isClickedCountryBottomSheet : Bool
    
    init(selectedCountryByUser: Country = MockData.defaultCountry,
         loginPropertys: LoginPropertys = LoginPropertys(),
         router: LoginNumberRouterPromoter = LoginNumberRouterPromoter(),
         verifectionID : String = "",
         isCheckMarked: Bool = false,
         isActivatePolicy: Bool = false,
         isActivateTerms: Bool = false,
         isFocusState: Bool,
         isPhoneCorrect : Bool = false,
         isClickedCountryBottomSheet : Bool = false
    )
    {
        self.selectedCountryByUser = selectedCountryByUser
        self.loginPropertys = loginPropertys
        self.verifectionID = verifectionID
        self.router = router
        self.isCheckMarked = isCheckMarked
        self.isActivatePolicy = isActivatePolicy
        self.isActivateTerms = isActivateTerms
        self.isPhoneCorrect = isPhoneCorrect
        self.isFocusState = isFocusState
        self.isClickedCountryBottomSheet = isClickedCountryBottomSheet
    }
    
    
}

// TODO: Change default country depends by local country of phone.
extension LoginNumberViewModel {
    struct MockData {
        static var defaultCountry = Country(name: "Turkey", dialogCode: "TR", countryCode: "+90", flag: "🇹🇷")
    }
}

