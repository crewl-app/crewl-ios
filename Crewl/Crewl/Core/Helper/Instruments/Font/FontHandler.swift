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
    
    // MARK: SpaceMedium
    static let SpaceMedium14 : Font = .custom(getFont.SpaceMedium, size: getSize.Medium14)
    
    // MARK: SpaceBold
    static let SpaceBold23 : Font = .custom(getFont.SpaceBold, size: getSize.Title22)
    static let SpaceBold22 : Font = .custom(getFont.SpaceBold, size: getSize.Title24)
    static let SpaceBold21 : Font = .custom(getFont.SpaceBold, size: getSize.Title22)
    static let SpaceBold20 : Font = .custom(getFont.SpaceBold, size: getSize.BigLarge20)
    static let SpaceBold13 : Font = .custom(getFont.SpaceBold, size: getSize.AltMedium13)
    
    //MARK: - SF Pro Rounded Fonts
    
    // MARK: Light
    static let RoundedLight18 : Font = .system(size: getSize.Large18 , weight: .light, design: .rounded)
    static let RoundedLight16 : Font = .system(size: getSize.Middle16, weight: .light, design: .rounded)
    static let RoundedLight14 : Font = .system(size: getSize.Medium14, weight: .light, design: .rounded)
    static let RoundedLight13 : Font = .system(size: getSize.AltMedium13, weight: .light, design: .rounded)
    static let RoundedLight12 : Font = .system(size: getSize.Regular12, weight: .light, design: .rounded)
    static let RoundedLight10 : Font = .system(size: getSize.Little10, weight: .light, design: .rounded)
    
    // MARK: Regular
    static let RoundedRegular18 : Font = .system(size: getSize.Large18, weight: .regular, design: .rounded)
    static let RoundedRegular17 : Font = .system(size: getSize.AltLarge17, weight: .regular, design: .rounded)
    static let RoundedRegular16 : Font = .system(size: getSize.Middle16, weight: .regular, design: .rounded)
    static let RoundedRegular12 : Font = .system(size: getSize.Regular12, weight: .regular, design: .rounded)
    static let RoundedRegular10 : Font = .system(size: getSize.Little10, weight: .regular, design: .rounded)
    
    // MARK: SemiBold
    static let RoundedSemiBold10 : Font = .system(size: getSize.Little10, weight: .semibold, design: .rounded)
    static let RoundedSemiBold14 : Font = .system(size: getSize.Medium14, weight: .semibold, design: .rounded)
    
    // MARK: Bold
    static let RoundedBold18 : Font = .system(size: getSize.Large18, weight: .bold, design: .rounded)
    static let RoundedBold12 : Font = .system(size: getSize.Regular12, weight: .bold, design: .rounded)
    static let RoundedBold11 : Font = .system(size: getSize.AltRegular11, weight: .bold, design: .rounded)

}
