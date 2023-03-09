//
//  LoginOTPRouter.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import Foundation

class LoginOTPRouter {}

protocol LoginOTPRouterCharter {
    func navigate() -> LoginSuccessView
}

extension LoginOTPRouter : LoginOTPRouterCharter {
    func navigate() -> LoginSuccessView {
        LoginSuccessView()
    }
}
