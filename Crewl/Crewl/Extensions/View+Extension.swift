//
//  ViewExtensions.swift
//  Crewl
//
//  Created by NomoteteS on 18.01.2023.
//

import SwiftUI
import Foundation

extension View {
    /// Button Disable
    /// - Parameter condition: Bool
    /// - Returns: Bool
     func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 1 : 0.5)
    }
}

