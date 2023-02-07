//
//  ImageHandler.swift
//  Crewl
//
//  Created by NomoteteS on 5.02.2023.
//

import SwiftUI

extension Image {
    
    public static let AppLogo = Image(ImageHelper.App.AppLogo.rawValue)
    public static let CrewlLogo = Image(ImageHelper.App.CrewlLogo.rawValue)
    
    // MARK: - Onboarding Views
    public static let OnboardingOne = Image(ImageHelper.Onboarding.OnboardingOne.rawValue)
    public static let OnboardingTwo = Image(ImageHelper.Onboarding.OnboardingTwo.rawValue)
    public static let OnboardingThree = Image(ImageHelper.Onboarding.OnboardingThree.rawValue)
    public static let OnboardingFour = Image(ImageHelper.Onboarding.OnboardinFour.rawValue)

    // MARK: - Notifications Views
    public static let Notification = Image(ImageHelper.Notifications.notification.rawValue)
    public static let Location = Image(ImageHelper.Notifications.location.rawValue)
}
