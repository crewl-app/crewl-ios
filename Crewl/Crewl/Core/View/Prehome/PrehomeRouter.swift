//
//  PrehomeRouter.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation

final class PrehomeRouter {}

protocol PrehomeRouterCharter {
    func navigateLogin() -> LoginNumberView
}

extension PrehomeRouter : PrehomeRouterCharter {
    func navigateLogin() -> LoginNumberView {
        LoginNumberView()
    }
}
