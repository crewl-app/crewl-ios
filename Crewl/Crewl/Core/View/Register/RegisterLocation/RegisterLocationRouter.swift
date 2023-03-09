//
//  RegisterLocationRouter.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

class RegisterLocationRouter {}

private protocol RegisterLocationRouterCharter {
    func navigate() -> RegisterPhotoView
}

extension RegisterLocationRouter : RegisterLocationRouterCharter {
    func navigate() -> RegisterPhotoView {
        RegisterPhotoView()
    }
}
