//
//  CrewlApp.swift
//  Crewl
//
//  Created by NomoteteS on 5.02.2023.
//

import SwiftUI

@main
struct CrewlApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(ViewModel: SplashViewModel(isActive: false))
                .preferredColorScheme(.light)
        }
    }
}
