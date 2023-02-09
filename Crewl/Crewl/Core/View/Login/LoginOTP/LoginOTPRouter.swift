//
//  LoginOTPRouter.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import Foundation

class LoginOTPRouter {}

protocol LoginOTPRouterCharter {
    func goToLoginSuccessView() -> LoginSuccessView
}

extension LoginOTPRouter : LoginOTPRouterCharter {
    func goToLoginSuccessView() -> LoginSuccessView {
        LoginSuccessView()
    }
    
    
}
