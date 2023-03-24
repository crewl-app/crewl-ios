//
//  RegisterGenderViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

typealias RegisterGenderRouterPromoter = RegisterGenderRouter
//TODO: Register ViewModel Benzet
class RegisterGenderViewModel: ObservableObject {
    
    var router = RegisterGenderRouterPromoter()
    //TODO: Tekrardan düzenlenecek
    @Published var nameData: String
    @Published var surnameData: String
    
    @Published var gender: String
    @Published var isSelectedGender: Bool
    @Published var isReadyToNextView: Bool
    
    init(router: RegisterGenderRouter = RegisterGenderRouter(),
         nameData: String,
         surnameData: String,
         gender: String = "",
         isSelectedGender: Bool = false,
         isReadyToNextView: Bool = false) {
        self.router = router
        self.nameData = nameData
        self.surnameData = surnameData
        self.gender = gender
        self.isSelectedGender = isSelectedGender
        self.isReadyToNextView = isReadyToNextView
    }
    
    var registerGenderItems : [RegisterGenderItem] = [
        RegisterGenderItem(genderImage: "registerGenderMan", genderName: "Erkek"),
        RegisterGenderItem(genderImage: "registerGenderWoman", genderName: "Kadın"),
        RegisterGenderItem(genderImage: "", genderName: "GAY")
    ]
}
