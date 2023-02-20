//
//  Int+Extension.swift
//  Crewl
//
//  Created by NomoteteS on 18.02.2023.
//

import Foundation

// dW -> dynamic width
// dH -> dynamic height

extension Int {
    func dW() -> Int {
        return self * Int(WindowUtils.screenSize.width)
    }
    
    func dH() -> Int {
        return self * Int(WindowUtils.screenSize.height)
    }
}
