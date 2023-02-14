//
//  PrehomeRouter.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation

final class PrehomeRouter {}

protocol PrehomeRouterCharter {
    func goToRegister() -> RegisterName
    func goToLogin(isKeyboardFocus: Bool) -> LoginNumberView
    
}

extension PrehomeRouter : PrehomeRouterCharter {
    func goToRegister() -> RegisterName {
        RegisterName()
    }
    
    func goToLogin(isKeyboardFocus: Bool) -> LoginNumberView {
        LoginNumberView(viewModel: .init(isFocusState: isKeyboardFocus))
    }
}
