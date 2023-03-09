//
//  RegisterPhotoRouter.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

class RegisterPhotoRouter {}

private protocol RegisterPhotoRouterCharter {
    func navigate() -> RegisterSuccessView
}

extension RegisterPhotoRouter: RegisterPhotoRouterCharter {
    func navigate() -> RegisterSuccessView {
        RegisterSuccessView()
    }
}
