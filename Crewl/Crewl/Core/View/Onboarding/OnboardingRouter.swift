//
//  OnboardingRouter.swift
//  Crewl
//
//  Created by NomoteteS on 6.02.2023.
//

import Foundation
import SwiftUI

final class OnboardingRouter {}

protocol OnboardingRouterCharter {
    func goToPrehome() -> PrehomeView
}

extension OnboardingRouter : OnboardingRouterCharter {
    func goToPrehome() -> PrehomeView {
        PrehomeView()
    }
}

