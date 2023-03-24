//
//  RegisterBirthViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

typealias RegisterBirthRouterPromoter = RegisterBirthRouter
//TODO: Register ViewModel Benzet
class RegisterBirthViewModel: ObservableObject {
    
    var router = RegisterBirthRouterPromoter()
    //TODO: Tekrardan düzenlenecek
    @Published var nameData: String
    @Published var surnameData: String
    @Published var genderData: String
    
    @Published var birth: String
    @Published var dayBirth: String
    @Published var monthBirth: String
    @Published var yearBirth: String
    @Published var isReadyToNextView: Bool
    @Published var isLegid: Bool
    
    init(nameData: String,
         surnameData: String,
         genderData: String,
         birth: String = "",
         dayBirth: String = "",
         monthBirth: String = "",
         yearBirth: String = "",
         isReadyToNextView: Bool = false,
         isLegid: Bool = false) {
        self.nameData = nameData
        self.surnameData = surnameData
        self.genderData = genderData
        self.birth = birth
        self.isReadyToNextView = isReadyToNextView
        self.dayBirth = dayBirth
        self.monthBirth = monthBirth
        self.yearBirth = yearBirth
        self.isLegid = isLegid
    }
    
    func collectionBirth() {
        self.birth = String("\(self.monthBirth)/\(self.dayBirth)/\(self.monthBirth)")
    }
}
