//
//  LoginOTPViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import Foundation
import FirebaseAuth

typealias LoginOTPRouterPromoter = LoginOTPRouter

class LoginOTPViewModel: ObservableObject {
        
    var router = LoginOTPRouterPromoter()
    
    @Published var number : String
    @Published var countryCode : String
    @Published var OTPString : String
    @Published var isOTPWrong : Bool
    @Published var isVerifectionCorrect : Bool
 

    init(number: String, countryCode : String, OTPString: String = "", isOTPWrong: Bool = false, isVerifectionCorrect : Bool = false) {
        self.number = number
        self.countryCode = countryCode
        self.OTPString = OTPString
        self.isOTPWrong = isOTPWrong
        self.isVerifectionCorrect = isVerifectionCorrect
    }
    
    
}
