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

extension Binding {
    /// Set Empty Value for Bindings Values
    /// - Parameter defaultValue: <#defaultValue description#>
    /// - Returns: <#description#>
    func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
