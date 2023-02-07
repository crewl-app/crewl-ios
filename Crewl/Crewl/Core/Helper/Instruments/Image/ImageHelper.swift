//
//  SetImage.swift
//  Crewl
//
//  Created by NomoteteS on 8.01.2023.
//

import Foundation

struct ImageHelper {
    
    enum App : String {
        case AppLogo = "AppLogo"
        case CrewlLogo = "CrewlLogo"
    }
    
    // MARK: - Onboarding Views
    enum Onboarding: String {
        case OnboardingOne = "firstOnboarding"
        case OnboardingTwo = "secondOnboarding"
        case OnboardingThree = "thirdOnboarding"
        case OnboardinFour = "fourthOnboarding"
    }
    
    // MARK: - Notifications Views
    enum Notifications: String {
        case notification = "notificationImage"
        case location = "locationImage"
    }
}
