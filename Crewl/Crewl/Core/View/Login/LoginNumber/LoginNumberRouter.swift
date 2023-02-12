//
//  LoginNumberRouter.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation

class LoginNumberRouter {}

protocol LoginNumberRouterCharter {
    func goToLoginOTPView(phoneNumber: PhoneNumber) -> LoginOTPView
}

extension LoginNumberRouter : LoginNumberRouterCharter {
    func goToLoginOTPView(phoneNumber: PhoneNumber) -> LoginOTPView {
        LoginOTPView(viewModel: LoginOTPViewModel(phoneNumber: phoneNumber))
    }
}
