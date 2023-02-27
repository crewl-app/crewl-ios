//
//  OnboardingItem.swift
//  Crewl
//
//  Created by NomoteteS on 6.02.2023.
//

import SwiftUI

// MARK: - Onboarding Items Setter
struct OnboardingItem : Identifiable, Equatable {
    var id: UUID = UUID()
    var title : String
    var image : Image
    var description : String
    var tag : Int
}
