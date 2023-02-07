//
//  SplashNav.swift
//  Crewl
//
//  Created by NomoteteS on 4.02.2023.
//

import Foundation
import SwiftUI

final class SplashRouter {}

protocol SplashRouterCharter {
    func goToOnboarding() -> OnboardingView
}

extension SplashRouter : SplashRouterCharter {
    func goToOnboarding() -> OnboardingView {
        OnboardingView(viewModel: .init(routerActive: Bool()))
    }
}
