//
//  LoginOTPViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import Foundation

typealias LoginOTPRouterPromoter = LoginOTPRouter

class LoginOTPViewModel: ObservableObject {
        
    var router = LoginOTPRouterPromoter()
    
    @Published var number : String
    @Published var OTPString : String
    @Published var isOTPWrong : Bool
        
    init(number: String, OTPString: String = "", isOTPWrong: Bool = false) {
        self.number = number
        self.OTPString = OTPString
        self.isOTPWrong = isOTPWrong
    }
}
