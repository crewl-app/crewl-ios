//
//  RegisterSuccessRouter.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

class RegisterSuccessRouter {}

private protocol RegisterSuccessRouterCharter {
    func navigateHome() -> HomeView
}

extension RegisterSuccessRouter: RegisterSuccessRouterCharter {
    func navigateHome() -> HomeView {
        HomeView()
    }
}
