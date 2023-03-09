//
//  RegisterBirthRouter.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

class RegisterBirthRouter {}

private protocol RegisterBirthRouterCharter {
    func navigate() -> RegisterLocationView
}

extension RegisterBirthRouter : RegisterBirthRouterCharter {
    func navigate() -> RegisterLocationView {
        RegisterLocationView()
    }
}
