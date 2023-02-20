//
//  LoginPropertys.swift
//  Crewl
//
//  Created by NomoteteS on 8.02.2023.
//

import Foundation

class LoginPropertys: ObservableObject {
    var userPhone : String
    var userCountry : String
    var userFlag : String
    
    init(userPhone : String = "", userFlag : String = "🇹🇷", userCountry : String = "90") {
        self.userPhone = userPhone
        self.userCountry = userCountry
        self.userFlag = userFlag
    }
    
    func completeLogin() -> String {
        return userCountry + userPhone
    }
}
