//
//  LoginNumberRouter.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation

class LoginNumberRouter {}

protocol LoginNumberRouterCharter {
    func navigate(phone: UserPhoneNumberModel) -> LoginOTPView
}

extension LoginNumberRouter : LoginNumberRouterCharter {
    func navigate(phone: UserPhoneNumberModel) -> LoginOTPView {
        LoginOTPView(phone: phone)
    }
}



