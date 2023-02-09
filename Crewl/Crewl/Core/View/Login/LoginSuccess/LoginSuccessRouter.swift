//
//  LoginSuccessRouter.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import Foundation

class LoginSuccessRouter {}

protocol LoginSuccessRouterCharter {
    func goToHomeView() -> HomeView
}

extension LoginSuccessRouter : LoginSuccessRouterCharter {
    func goToHomeView() -> HomeView {
        HomeView()
    }
}
