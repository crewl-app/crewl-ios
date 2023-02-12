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
    
    @Published var phoneNumber : PhoneNumber
    @Published var OTPString : String
    @Published var isOTPWrong : Bool
    @Published var isVerifectionCorrect : Bool
 

    init(phoneNumber: PhoneNumber, OTPString: String = "", isOTPWrong: Bool = false, isVerifectionCorrect : Bool = false) {
        self.phoneNumber = phoneNumber
        self.OTPString = OTPString
        self.isOTPWrong = isOTPWrong
        self.isVerifectionCorrect = isVerifectionCorrect
    }
    
    
}
