//
//  LoginNumberRouter.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation

class LoginNumberRouter {}

protocol LoginNumberRouterCharter {
    func goToLoginOTPView(number: String, countryCode: String) -> LoginOTPView
}

extension LoginNumberRouter : LoginNumberRouterCharter {
    func goToLoginOTPView(number: String, countryCode: String) -> LoginOTPView {
        LoginOTPView(viewModel: LoginOTPViewModel(number: number, countryCode: countryCode))
    }
}
