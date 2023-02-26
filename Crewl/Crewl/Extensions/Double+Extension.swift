//
//  Double+Extension.swift
//  Crewl
//
//  Created by NomoteteS on 18.02.2023.
//

import Foundation

// dW -> dynamic width
// dH -> dynamic height

extension Double {
    func dW() -> Double {
        return self * WindowUtils.screenSize.width
    }
    
    func dH() -> Double {
        return self * WindowUtils.screenSize.height
    }
}
