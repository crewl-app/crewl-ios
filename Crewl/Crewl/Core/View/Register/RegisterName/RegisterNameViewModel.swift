//
//  RegisterNameViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 4.03.2023.
//

import Foundation

typealias RegisterNameRouterPromoter = RegisterNameRouter
//TODO: RegisterName ViewModel Benzet
class RegisterNameViewModel: ObservableObject {
    
    var router = RegisterNameRouterPromoter()
    //TODO: Tekrardan düzenlenecek    
    @Published var isStatus: Bool
    @Published var isStatusShow: Bool
    @Published var isOpacityShown: Bool
    @Published var isReadyToNextView : Bool
    @Published var name: String?
    @Published var surname: String?
    var user = UserModel()
    
    init(router: RegisterNameRouterPromoter = RegisterNameRouterPromoter(),
         isStatus: Bool = false,
         isStatusShow: Bool = false,
         isOpacityShown: Bool = false,
         isReadyToNextView: Bool = false,
         name: String? = UserModel().fullname?.name ,
         surname: String? = UserModel().fullname?.surname
         ) {
        self.router = router
        self.isStatus = isStatus
        self.isStatusShow = isStatusShow
        self.isOpacityShown = isOpacityShown
        self.isReadyToNextView = isReadyToNextView
        self.name = name
        self.surname = surname
    }
    
    func save() {
        let fullname = UserNameModel(name: self.name! , surname: self.surname ?? "")
        user.fullname = fullname
    }
}
