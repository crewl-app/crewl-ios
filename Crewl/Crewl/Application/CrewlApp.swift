//
//  CrewlApp.swift
//  Crewl
//
//  Created by NomoteteS on 5.02.2023.
//

import SwiftUI
import UIKit
import Firebase


@main

struct CrewlApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                OnboardingView()
                    .navigationBarHidden(true)
                    .preferredColorScheme(.light)
            }
        }
    }
}

