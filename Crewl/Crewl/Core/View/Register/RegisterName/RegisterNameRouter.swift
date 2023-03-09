//
//  RegisterNameRouter.swift
//  Crewl
//
//  Created by NomoteteS on 4.03.2023.
//

import Foundation

class RegisterNameRouter {}

private protocol RegisterNameRouterCharter {
    func navigate(name: String, surname: String) -> RegisterGenderView
}

extension RegisterNameRouter: RegisterNameRouterCharter {
    func navigate(name: String, surname: String) -> RegisterGenderView {
        RegisterGenderView(viewModel: .init(nameData: name, surnameData: surname))
    }
}





