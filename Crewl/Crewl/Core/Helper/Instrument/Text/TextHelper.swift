//
//  SetText.swift
//  Crewl
//
//  Created by NomoteteS on 8.01.2023.
//

import Foundation
import SwiftUI

struct TextHelper {
    
    //MARK: - Button Text String
    enum ButtonText : String {
        case Continue = "continue"
        case Confirm = "confirm"
        case SendVerification = "sendVerification"
        case Later = "later"
        case Allow = "allow"
    }
    
    //MARK: - Onboarding Text String
    enum Onboarding : String {
        case FirstOnboardingTitle = "firstOnboardingTitle"
        case FirstOnboardingDescription = "firstOnboardingDescription"
        
        case SecondOnboardingTitle = "secondOnboardingTitle"
        case SecondOnboardingDescription = "secondOnboardingDescription"
        
        case ThirdOnboardingTitle = "thirdOnboardingTitle"
        case ThirdOnboardingDescription = "thirdOnboardingDescription"
        
        case FourthOnboardingTitle = "fourthOnboardingTitle"
        case FourthOnboardingDescription = "fourthOnboardingDescription"
    }
    
    //MARK: - Login Text String
    enum LoginText : String {
        case LoginTitle = "loginTitle"
        case LoginDescription = "loginDescription"
        case VerificationText = "verificationText"
        case SendedCodeNumber = "sendedCodeNumber"
        case AttentionMassage = "attentionMassage"
        case ConfirmInLastLogin = "confirmInLastLogin"
        case NextToPageInLastLogin = "nextToPageInLastLogin"
    }
    
    //MARK: - Notifications Text String
    enum Notifications : String {
        case NotifacionServiceTitle = "notifacionServiceTitle"
        case NotifacionServiceDescription = "notifacionServiceDescription"
        case LocationServiceTitle = "locationServiceTitle"
        case LocationServiceDescription = "locationServiceDescription"
    }
    
    //MARK: - TermService Text String
    enum TermsService : String {
        case PrivacyPolicy = "privacyPolicy"
        case PrivacyPolicyDescription = "privacyPolicyDescription"
        case TermsOfUser = "termsOfUse"
        case TermsOfUseDescription = "termsOfUseDescription"
    }
    //MARK: - /
}


extension String {
    /// It localize any string from Localizable.stirng
    /// - Returns: Localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
