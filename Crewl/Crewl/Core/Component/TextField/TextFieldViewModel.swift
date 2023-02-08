//
//  TextFieldViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 8.02.2023.
//

import Foundation

final class TextFieldViewModel : ObservableObject {
    var loginPropertys = LoginPropertys()
    
    @Published var tab : Bool
    
    init(tab : Bool = false, loginPropertys : LoginPropertys = LoginPropertys() ) {
        self.tab = tab
        self.loginPropertys = loginPropertys
    }
}
