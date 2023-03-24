//
//  LoginOTPRouter.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import Foundation

class LoginOTPRouter {}

protocol LoginOTPRouterCharter {
    func navigateSuccess() -> LoginSuccessView
    func navigateRegister() -> RegisterNameView
}

extension LoginOTPRouter : LoginOTPRouterCharter {
    func navigateSuccess() -> LoginSuccessView {
        LoginSuccessView()
    }
    func navigateRegister() -> RegisterNameView {
        RegisterNameView()
    }
}



