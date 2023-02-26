//
//  State.swift
//  Crewl
//
//  Created by NomoteteS on 19.01.2023.
//

import Foundation
import SwiftUI

extension Binding where Value == String {
    
    /// set limit string values
    /// - Parameter lenght: Int
    /// - Returns: self
    func limit(_ lenght: Int) -> Self {
        if self.wrappedValue.count > lenght {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(lenght))
            }
        }
        return self
    }

}
