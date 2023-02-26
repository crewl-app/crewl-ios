//
//  SetImage.swift
//  Crewl
//
//  Created by NomoteteS on 8.01.2023.
//

import Foundation

struct ImageHelper {
    // MARK: - app
    enum app : String {
        case appLogo = "appLogo"
    }
    
    // MARK: - onboarding Images
    enum onboarding: String {
        case OnboardingOne = "firstOnboarding"
        case OnboardingTwo = "secondOnboarding"
        case OnboardingThree = "thirdOnboarding"
        case OnboardinFour = "fourthOnboarding"
    }
    
    // MARK: - Prehome Images
    enum prehome: String {
        case PreHomeBackgroundSE = "preHomeBackgroundSE"
        case PreHomeBackgroundMax = "preHomeBackgroundMax"
    }
    
    // MARK: - Login Images
    enum Login: String {
        case LoginSuccess = "loginSuccess"
        case PrivacyPolicy = "privacyPolicy"
        case TermsOfService = "termsOfService"
    }
    
    // MARK: - Notifications Images
    enum Notifications: String {
        case notification = "notificationImage"
        case location = "locationImage"
    }
}
    // MARK: - /
