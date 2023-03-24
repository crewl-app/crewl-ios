//
//  RegisterGenderRouter.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

class RegisterGenderRouter {}

private protocol RegisterGenderRouterCharter {
    func navigate(nameData: String, surnameData: String, genderData: String) -> RegisterBirthView
}

extension RegisterGenderRouter : RegisterGenderRouterCharter {
    func navigate(nameData: String, surnameData: String, genderData: String) -> RegisterBirthView {
        RegisterBirthView(viewModel: .init(nameData: nameData,
                                           surnameData: surnameData,
                                           genderData: genderData))
    }
}
