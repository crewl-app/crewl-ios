//
//  RegisterNameViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 4.03.2023.
//

import Foundation

typealias RegisterNameRouterPromoter = RegisterNameRouter

class RegisterNameViewModel: ObservableObject {
    
    var router = RegisterNameRouterPromoter()
    
    @Published var isStatus: Bool
    @Published var isStatusShow: Bool
    @Published var isOpacityShown: Bool
    @Published var isReadyToNextView : Bool
    @Published var name: String?
    @Published var surname: String?
    
    init(router: RegisterNameRouterPromoter = RegisterNameRouterPromoter(),
         isStatus: Bool = false,
         isStatusShow: Bool = false,
         isOpacityShown: Bool = false,
         isReadyToNextView: Bool = false,
         name: String? = User().fullname?.name ,
         surname: String? = User().fullname?.surname) {
        self.router = router
        self.isStatus = isStatus
        self.isStatusShow = isStatusShow
        self.isOpacityShown = isOpacityShown
        self.isReadyToNextView = isReadyToNextView
        self.name = name
        self.surname = surname
    }
}
