//
//  SplashModel.swift
//  Crewl
//
//  Created by NomoteteS on 4.02.2023.
//

import SwiftUI

typealias SplashRoutePromoter = SplashRouter

final class SplashViewModel: ObservableObject {
    
    @Published var isActive = false
    
    var router = SplashRoutePromoter()
    
    init(isActive : Bool, router: SplashRoutePromoter = SplashRoutePromoter()) {
        self.isActive = isActive
        self.router = router
        splashCountdown()
    }
    
    func splashCountdown() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isActive = true
        }
    }
}

