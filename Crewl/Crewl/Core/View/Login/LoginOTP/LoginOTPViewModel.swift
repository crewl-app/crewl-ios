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
    @Published var OTPString : String
    @Published var isOTPWrong : Bool
    @Published var isReSended : Bool
    @Published var isVerifectionCorrect : Bool
 

    init(number: String, OTPString: String = "", isOTPWrong: Bool = false, isReSended : Bool = false, isVerifectionCorrect : Bool = false) {
        self.number = number
        self.OTPString = OTPString
        self.isOTPWrong = isOTPWrong
        self.isReSended = isReSended
        self.isVerifectionCorrect = isVerifectionCorrect
    }
    
    
}
