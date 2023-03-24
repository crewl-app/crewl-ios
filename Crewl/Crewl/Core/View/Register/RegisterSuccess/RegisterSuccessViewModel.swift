//
//  RegisterSuccessViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

typealias RegisterSuccessPromoter = RegisterSuccessRouter

class RegisterSuccessViewModel: ObservableObject {
    
    var router = RegisterSuccessPromoter()
    
    @Published var userName : String
    @Published var userSurname : String
    @Published var userPhoneNumber : String
    @Published var userLatitude : Double
    @Published var userLongitude : Double
    @Published var userBirthDate : String
    @Published var userGender : String
    @Published var userImage : UIImage
    
    init(
        userName : String = UserModel().fullname!.name,
        userSurname : String = UserModel().fullname?.surname ?? "",
        userPhoneNumber : String = UserModel().phoneNumber!.fullNumber,
        userLatitude : Double = UserModel().location!.latitude,
        userLongitude : Double = UserModel().location!.longitude,
        userBirthDate : String = UserModel().birthdate!.birthday,
        userGender : String = UserModel().gender!,
        userImage : UIImage = UserModel().profileImageUrl!
    ) {
        self.userName = userName
        self.userSurname = userSurname
        self.userPhoneNumber = userPhoneNumber
        self.userLongitude = userLongitude
        self.userLatitude = userLatitude
        self.userBirthDate = userBirthDate
        self.userGender = userGender
        self.userImage = userImage
    }
}
