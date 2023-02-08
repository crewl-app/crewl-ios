//
//  LoginPropertys.swift
//  Crewl
//
//  Created by NomoteteS on 8.02.2023.
//

import Foundation


final class LoginPropertys: ObservableObject {
    @Published var userPhone : String
    @Published var userCountry : String
    @Published var userOTP : String
    
    init(userOTP : String = "" , userPhone : String = "", userCountry : String = "+90") {
        self.userPhone = userPhone
        self.userCountry = userCountry
        self.userOTP = userOTP
    }
}
