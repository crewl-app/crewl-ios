//
//  RegisterGenderRouter.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

class RegisterGenderRouter {}

private protocol RegisterGenderRouterCharter {
    func navigate() -> RegisterBirthView
}

extension RegisterGenderRouter : RegisterGenderRouterCharter {
    func navigate() -> RegisterBirthView {
        RegisterBirthView()
    }
}
