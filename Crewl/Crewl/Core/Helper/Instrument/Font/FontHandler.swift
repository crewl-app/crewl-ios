//
//  FontManager.swift
//  Crewl
//
//  Created by NomoteteS on 5.01.2023.
//

import Foundation
import SwiftUI

// Calling font and settings
private let getFont = SGFonts()
private let getSize = FontSize()

extension Font {
        
    //MARK: - Font Space Grotest Fonts
        
    // MARK: Font SpaceMedium
    static let SpaceMedium14 : Font = .custom(getFont.SpaceMedium, size: getSize.size14)
    
    // MARK: Font SpaceBold
    static let SpaceBold27 : Font = .custom(getFont.SpaceBold, size: getSize.size27, relativeTo: .largeTitle)
    static let SpaceBold26 : Font = .custom(getFont.SpaceBold, size: getSize.size26, relativeTo: .largeTitle)
    static let SpaceBold25 : Font = .custom(getFont.SpaceBold, size: getSize.size25, relativeTo: .largeTitle)
    static let SpaceBold24 : Font = .custom(getFont.SpaceBold, size: getSize.size24, relativeTo: .largeTitle)
    static let SpaceBold23 : Font = .custom(getFont.SpaceBold, size: getSize.size23, relativeTo: .largeTitle)
    static let SpaceBold22 : Font = .custom(getFont.SpaceBold, size: getSize.size22, relativeTo: .title2)
    static let SpaceBold21 : Font = .custom(getFont.SpaceBold, size: getSize.size21, relativeTo: .title3)
    static let SpaceBold20 : Font = .custom(getFont.SpaceBold, size: getSize.size20, relativeTo: .title3)
    static let SpaceBold19 : Font = .custom(getFont.SpaceBold, size: getSize.size19, relativeTo: .title3)
    static let SpaceBold18 : Font = .custom(getFont.SpaceBold, size: getSize.size18, relativeTo: .title3)
    static let SpaceBold17 : Font = .custom(getFont.SpaceBold, size: getSize.size17, relativeTo: .title3)
    static let SpaceBold16 : Font = .custom(getFont.SpaceBold, size: getSize.size16, relativeTo: .title3)
    static let SpaceBold15 : Font = .custom(getFont.SpaceBold, size: getSize.size15, relativeTo: .title3)
    static let SpaceBold14 : Font = .custom(getFont.SpaceBold, size: getSize.size14, relativeTo: .title3)
    static let SpaceBold13 : Font = .custom(getFont.SpaceBold, size: getSize.size13, relativeTo: .footnote)
    static let SpaceBold10 : Font = .custom(getFont.SpaceBold, size: getSize.size10, relativeTo: .caption2)
    
    //MARK: - Font SF Pro Rounded Fonts
    
    static let Rounded34 : Font = .system(.largeTitle, design: .rounded)
    static let Rounded28 : Font = .system(.title, design: .rounded)
    static let Rounded22 : Font = .system(.title2, design: .rounded)
    static let Rounded20 : Font = .system(.title3, design: .rounded)
    static let Rounded18 : Font = .system(.headline, design: .rounded)
    static let Rounded17 : Font = .system(.body, design: .rounded)
    static let Rounded14 : Font = .system(.footnote, design: .rounded)
    static let Rounded16 : Font = .system(.callout, design: .rounded)
    static let Rounded15 : Font = .system(.subheadline, design: .rounded)
    static let Rounded13 : Font = .system(.footnote, design: .rounded)
    static let Rounded12 : Font = .system(.caption, design: .rounded)
    static let Rounded10 : Font = .system(.caption2, design: .rounded)
}
