//
//  NotiLocationRouter.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

class NotiLocationRouter {}

private protocol NotiLocationCharter {
    func navigate() -> NotiNotificationView
}

extension NotiLocationRouter: NotiLocationCharter {
    func navigate() -> NotiNotificationView {
        NotiNotificationView()
    }
}
