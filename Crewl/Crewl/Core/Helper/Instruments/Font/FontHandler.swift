//
//  FontManager.swift
//  Crewl
//
//  Created by NomoteteS on 5.01.2023.
//

import Foundation
import SwiftUI

// Calling font and settings
private let getFont = Fonts()
private let getSize = FontSize()

extension Font {
    
    //MARK: - Space Grotest Fonts
    
    // MARK: SpaceBold
    static let SpaceBold23 : Font = .custom(getFont.SpaceBold, size: getSize.AltTitle)
    static let SpaceBold22 : Font = .custom(getFont.SpaceBold, size: getSize.Title)
    static let SpaceBold21 : Font = .custom(getFont.SpaceBold, size: getSize.AltTitle)
    static let SpaceBold20 : Font = .custom(getFont.SpaceBold, size: getSize.BigLarge)
    static let SpaceBold13 : Font = .custom(getFont.SpaceBold, size: getSize.AltMedium)
    
    //MARK: - SF Pro Rounded Fonts
    
    // MARK: Light
    static let RoundedLight18 : Font = .system(size: getSize.Large, weight: .light, design: .rounded)
    static let RoundedLight16 : Font = .system(size: getSize.Middle, weight: .light, design: .rounded)
    static let RoundedLight14 : Font = .system(size: getSize.Medium, weight: .light, design: .rounded)
    static let RoundedLight13 : Font = .system(size: getSize.AltMedium, weight: .light, design: .rounded)
    static let RoundedLight12 : Font = .system(size: getSize.Regular, weight: .light, design: .rounded)
    static let RoundedLight10 : Font = .system(size: getSize.Little, weight: .light, design: .rounded)
    
    // MARK: Regular
    static let RoundedRegular18 : Font = .system(size: getSize.Large, weight: .regular, design: .rounded)
    static let RoundedRegular17 : Font = .system(size: getSize.AltLarge, weight: .regular, design: .rounded)
    static let RoundedRegular16 : Font = .system(size: getSize.Middle, weight: .regular, design: .rounded)
    static let RoundedRegular12 : Font = .system(size: getSize.Regular, weight: .regular, design: .rounded)
    static let RoundedRegular10 : Font = .system(size: getSize.Little, weight: .regular, design: .rounded)
    
    // MARK: SemiBold
    static let RoundedSemiBold10 : Font = .system(size: getSize.Little, weight: .semibold, design: .rounded)
    static let RoundedSemiBold14 : Font = .system(size: getSize.Medium, weight: .semibold, design: .rounded)
    
    // MARK: Bold
    static let RoundedBold18 : Font = .system(size: getSize.Large, weight: .bold, design: .rounded)
    static let RoundedBold12 : Font = .system(size: getSize.Regular, weight: .bold, design: .rounded)
    static let RoundedBold11 : Font = .system(size: getSize.AltRegular, weight: .bold, design: .rounded)

}
