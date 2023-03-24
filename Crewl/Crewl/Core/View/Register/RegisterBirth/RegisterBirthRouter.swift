//
//  RegisterBirthRouter.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

class RegisterBirthRouter {}

private protocol RegisterBirthRouterCharter {
    func navigate(nameData: String, surnameData: String, genderData: String, birthData: String) -> RegisterLocationView
}

extension RegisterBirthRouter : RegisterBirthRouterCharter {
    func navigate(nameData: String, surnameData: String, genderData: String, birthData: String) -> RegisterLocationView {
        RegisterLocationView(viewModel: .init(nameData: nameData, surnameData: surnameData, genderData: genderData, birthData: birthData))
    }
}
