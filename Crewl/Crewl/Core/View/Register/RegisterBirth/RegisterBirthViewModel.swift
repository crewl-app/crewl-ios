//
//  RegisterBirthViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation

typealias RegisterBirthRouterPromoter = RegisterBirthRouter

class RegisterBirthViewModel: ObservableObject {
    var birth: String
    
    init(birth: String = "") {
        self.birth = birth
    }
}
