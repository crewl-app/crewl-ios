//
//  PrivacyPolicyViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation

final class PrivacyPolicyViewModel: ObservableObject {
    @Published var checkMarked : Bool
    @Published var activatePolicy : Bool
    @Published var activateTerms : Bool
    
    
    init(checkMarked : Bool = false ,activateTerms : Bool = false, activatePolicy : Bool = false) {
        self.checkMarked = checkMarked
        self.activatePolicy = activatePolicy
        self.activateTerms = activateTerms
    }
}


// DATA AKIŞI yapman gerekiyor bunlara view model yerine sadece data ataman gerekiyor onları izleyip ana yolu takip edecek şekilde
