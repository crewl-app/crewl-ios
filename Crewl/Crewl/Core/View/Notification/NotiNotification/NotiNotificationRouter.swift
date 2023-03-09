//
//  NotiNotificationRouter.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation


class NotiNotificationRouter {}

protocol NotiNotificationCharter {
    func navigate() -> HomeView
}

extension NotiNotificationRouter: NotiNotificationCharter {
    func navigate() -> HomeView {
        HomeView()
    }
}



