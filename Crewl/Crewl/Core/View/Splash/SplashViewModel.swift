//
//  SplashModel.swift
//  Crewl
//
//  Created by NomoteteS on 4.02.2023.
//

import SwiftUI

typealias SplashRoutePromoter = SplashRouter

final class SplashViewModel: ObservableObject {
    
    @Published var isActive : Bool
    
    var router = SplashRoutePromoter()
    
    init(isActive : Bool = false,
         router: SplashRoutePromoter = SplashRoutePromoter())
    {
        self.isActive = isActive
        self.router = router
        startCountdown()
    }
    
    func startCountdown() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isActive = true
        }
    }
    
    func setPhoneDimensions(size: CGSize) {
        WindowUtils.screenSize = size
    }
}
