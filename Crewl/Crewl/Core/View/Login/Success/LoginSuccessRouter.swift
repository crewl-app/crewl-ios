//
//  LoginSuccessRouter.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import Foundation

class LoginSuccessRouter {}

protocol LoginSuccessRouterCharter {
    func navigate() -> HomeView
}

extension LoginSuccessRouter : LoginSuccessRouterCharter {
    func navigate() -> HomeView {
        HomeView()
    }
}
