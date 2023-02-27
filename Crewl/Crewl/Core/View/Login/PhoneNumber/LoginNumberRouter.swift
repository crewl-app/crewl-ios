//
//  LoginNumberRouter.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation

class LoginNumberRouter {}

protocol LoginNumberRouterCharter {
    func navigate(phone: PhoneNumber) -> LoginOTPView
}

extension LoginNumberRouter : LoginNumberRouterCharter {
    func navigate(phone: PhoneNumber) -> LoginOTPView {
        LoginOTPView(phone: phone)
    }
}



