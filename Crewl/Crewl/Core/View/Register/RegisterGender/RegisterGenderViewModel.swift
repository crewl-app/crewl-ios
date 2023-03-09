//
//  RegisterGenderViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

typealias RegisterGenderRouterPromoter = RegisterGenderRouter

class RegisterGenderViewModel: ObservableObject {
    
    var router = RegisterGenderRouter()
    
    @Published var nameData: String
    @Published var surnameData: String
    @Published var gender: String
    
    init(router: RegisterGenderRouter = RegisterGenderRouter(),
         nameData: String,
         surnameData: String,
         gender: String = "") {
        self.router = router
        self.nameData = nameData
        self.surnameData = surnameData
        self.gender = gender
    }
    
    var registerGenderItems : [RegisterItem] = [
        RegisterItem(image: Image("nootNootMale"), gender: "Erkek"),
        RegisterItem(image: Image("nootNootWoman"), gender: "Kadın"),
        RegisterItem(image: Image(""), gender: "Onun bunun")
    ]
}
