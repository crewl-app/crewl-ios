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
    func goToPrehome() -> Prehome
}

extension OnboardingRouter : OnboardingRouterCharter {
    func goToPrehome() -> Prehome {
        Prehome()
    }
}

