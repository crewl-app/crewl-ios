//
//  State.swift
//  Crewl
//
//  Created by NomoteteS on 19.01.2023.
//

import Foundation
import SwiftUI

extension Binding where Value == String {
    func limit(_ lenght: Int) -> Self {
        if self.wrappedValue.count > lenght {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(lenght))
            }
        }
        return self
    }
    
    func cWitdh(_ cWidth: Double) -> Double {
        let main = UIScreen.main
        let bounds = main.bounds
        let width = bounds.width
        
        return width * cWidth
    }
}
