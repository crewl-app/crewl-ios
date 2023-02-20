//
//  UserData.swift
//  Crewl
//
//  Created by NomoteteS on 19.02.2023.
//

import Foundation

class UserData {
    var userNumber : String
    var userCountry : String
    var userName : String
    var userSurname : String
    var userBirthday : String
    
    init(userNumber: String = "", userCountry: String = "", userName: String = "", userSurname: String = "", userBirthday: String = "") {
        self.userNumber = userNumber
        self.userCountry = userCountry
        self.userName = userName
        self.userSurname = userSurname
        self.userBirthday = userBirthday
    }
    
    func getFullNumber() -> String {
        return userNumber + userCountry
    }
}
