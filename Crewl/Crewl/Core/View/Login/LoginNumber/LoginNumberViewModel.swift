//
//  LoginNumberViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation

final class LoginNumberViewModel : ObservableObject {
    @Published var loginPropertys = LoginPropertys()
    @Published var pp = PrivacyPolicyViewModel(checkMarked: Bool())
    
    init(loginPropertys: LoginPropertys = LoginPropertys(), pp: PrivacyPolicyViewModel = PrivacyPolicyViewModel(checkMarked: Bool())) {
        self.loginPropertys = loginPropertys
        self.pp = pp
    }

}
