//
//  OnboardingViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 6.02.2023.
//

import Foundation
import SwiftUI

typealias OnboardingRouterPromoter = OnboardingRouter

class OnboardingViewModel : ObservableObject {
  
    var scaleSize: Double = 1.0
    /* */
    var router = OnboardingRouterPromoter()
    @Published var pageIndex = 0
    @Published var routerActive : Bool
    
    init(router: OnboardingRouterPromoter = OnboardingRouterPromoter(),
         pageIndex: Int = 0,
         routerActive: Bool = false)
    {
        self.router = router
        
        /* */
		if (UIScreen.main.bounds.height < 680) { scaleSize = 0.9 }
        /* */
        
        self.pageIndex = pageIndex
        self.routerActive = routerActive
    }
    
    var onboardingItems : [OnboardingItem] = [
        OnboardingItem(title: TextHelper.Onboarding.FirstOnboardingTitle.rawValue,
                       image: Image.OnboardingOne,
                       description: TextHelper.Onboarding.FirstOnboardingDescription.rawValue,
                       tag: 0),
        OnboardingItem(title: TextHelper.Onboarding.SecondOnboardingTitle.rawValue,
                       image: Image.OnboardingTwo,
                       description: TextHelper.Onboarding.SecondOnboardingDescription.rawValue,
                       tag: 1),
        OnboardingItem(title: TextHelper.Onboarding.ThirdOnboardingTitle.rawValue,
                       image: Image.OnboardingThree,
                       description: TextHelper.Onboarding.ThirdOnboardingDescription.rawValue,
                       tag: 2),
        OnboardingItem(title: TextHelper.Onboarding.FourthOnboardingTitle.rawValue,
                       image: Image.OnboardingFour,
                       description: TextHelper.Onboarding.FourthOnboardingDescription.rawValue,
                       tag: 3)
    ]
}


