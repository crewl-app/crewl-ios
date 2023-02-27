//
//  PrehomeRouter.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation

final class PrehomeRouter {}

protocol PrehomeRouterCharter {
    func navigateRegister() -> RegisterName
    func navigateLogin() -> LoginNumberView
}

extension PrehomeRouter : PrehomeRouterCharter {
    func navigateRegister() -> RegisterName {
        RegisterName()
    }
    
    func navigateLogin() -> LoginNumberView {
        LoginNumberView()
    }
}
