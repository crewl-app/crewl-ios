//
//  NotiNotificationViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

typealias NotiNotificationRouterPromoter = NotiNotificationRouter

class NotiNotificationViewModel: ObservableObject {
    
    @Published var isSkipPage : Bool
    
    var router : NotiNotificationRouterPromoter
    
    init(isSkipPage: Bool = false,
         router: NotiNotificationRouterPromoter = NotiNotificationRouterPromoter()){
        self.isSkipPage = isSkipPage
        self.router = router
    }
    
    func getNoti() {
        UNUserNotificationCenter.current().requestAuthorization(
          
          completionHandler: {_, _ in })
    }
}
