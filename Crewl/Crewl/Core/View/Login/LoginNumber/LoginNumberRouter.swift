//
//  LoginNumberRouter.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation

class LoginNumberRouter {}

protocol LoginNumberRouterCharter {
    func goToLoginOTPView(number: String) -> LoginOTPView
}

extension LoginNumberRouter : LoginNumberRouterCharter {
    func goToLoginOTPView(number: String) -> LoginOTPView {
        LoginOTPView()
    }
}
