//
//  LoginPropertys.swift
//  Crewl
//
//  Created by NomoteteS on 8.02.2023.
//

import Foundation


class LoginPropertys: ObservableObject {
    @Published var userPhone : String
    @Published var userCountry : String
    
    init(userPhone : String = "", userCountry : String = "+90") {
        self.userPhone = userPhone
        self.userCountry = userCountry
    }
    
    func compeleteLogin() -> String {
        return userCountry + userPhone
    }
}
