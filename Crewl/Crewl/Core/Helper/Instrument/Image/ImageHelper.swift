//
//  SetImage.swift
//  Crewl
//
//  Created by NomoteteS on 8.01.2023.
//

import Foundation

struct ImageHelper {
    // MARK: ImageHelper - App
    enum app : String {
        case appLogo = "appLogo"
    }
    
    // MARK: ImageHelper - onboarding Images
    enum onboarding: String {
        case OnboardingOne = "firstOnboarding"
        case OnboardingTwo = "secondOnboarding"
        case OnboardingThree = "thirdOnboarding"
        case OnboardinFour = "fourthOnboarding"
    }
    
    // MARK: ImageHelper - Prehome Images
    enum prehome: String {
        case PreHomeBackgroundSE = "preHomeBackgroundSE"
        case PreHomeBackgroundMax = "preHomeBackgroundMax"
    }
    
    // MARK: ImageHelper - Login Images
    enum login: String {
        case LoginSuccess = "loginSuccess"
        case PrivacyPolicy = "privacyPolicy"
        case TermsOfService = "termsOfService"
    }
    
    // MARK: ImageHelper - Register Imager
    enum register: String {
        case RegisterPhoto = "registerPhoto"
        case RegisterSuccess = "registerSuccess"
    }
    
    // MARK: ImageHelper - Notifications Images
    enum Notifications: String {
        case NotiNotification = "notiNotification"
        case NotiLocation = "notiLocation"
    }
}
    // MARK: ImageHelper - /
