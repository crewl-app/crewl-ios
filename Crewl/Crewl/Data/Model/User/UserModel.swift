//
//  UserData.swift
//  Crewl
//
//  Created by NomoteteS on 19.02.2023.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseAuth

//MARK: UserModel - UserData
struct UserModel : Identifiable {
    @DocumentID var id: String?
    var phoneNumber : UserPhoneNumberModel?
    var fullname: UserNameModel?
    var gender: String?
    var birthdate: UserBirthdateModel?
    var location: UserLocationModel?
    var profileImageUrl: UIImage?
}
//MARK: UserModel - UserPhoneNumberModel(Code + Number)
struct UserPhoneNumberModel {
    var code : String
    var number: String
    
    var fullNumber:  String {
        return code + number
    }
}
//MARK: UserModel - UserNameModel(Name + Surname) -> Fullname
struct UserNameModel : Equatable {
    var name: String
    var surname: String
    
    var fullname: String {
        return name + surname
    }
}
//MARK: UserModel - UserBirthdateModel(Day + Month + year) -> Birthday
struct UserBirthdateModel {
    var day: String
    var Month: String
    var year: String
    
    var birthday: String {
        return day + Month + year
    }
}
//MARK: UserModel - UserLocationModel(Latitude + Longitude)
struct UserLocationModel {
    var latitude: Double
    var longitude: Double
}
