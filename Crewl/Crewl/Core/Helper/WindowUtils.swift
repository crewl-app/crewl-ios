//
//  WindowUtils.swift
//  Crewl
//
//  Created by NomoteteS on 18.02.2023.
//

import Foundation

class WindowUtils {
    static var screenSize : CGSize = CGSize()
    static var windowType = getWindowType()
    
    private static func getWindowType() -> WindowType {
        var windowType = WindowType.High
        if screenSize.height < 648 {
            windowType = WindowType.Small
        }
        return windowType
    }
}


enum WindowType {
    case Small, High
}
