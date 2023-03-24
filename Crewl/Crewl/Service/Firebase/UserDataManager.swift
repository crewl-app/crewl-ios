//
//  UserDataManager.swift
//  Crewl
//
//  Created by NomoteteS on 9.03.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import Firebase
import CoreLocation

class UserDataManager: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var userModel: UserModel?
    
    static let shared = UserDataManager()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func regsiter(userName: String,
                  userSurname: String,
                  userPhone: String,
                  latitude: Double,
                  longitude: Double,
                  userImage: UIImage?,
                  userBirthdate: String,
                  userGender: String) {
        
        guard let userImage = userImage else { return }
        
        ImageUploaderManager.uploadImage(image: userImage) { imageUrl in
            let data = ["uid": self.userSession?.uid,
                        "name": userName,
                        "surname": userSurname,
                        "phoneNumber": userPhone,
                        "location": ["latitude":latitude,
                                     "longitude":longitude],
                        "imageUrl": imageUrl,
                        "birthdate": userBirthdate,
                        "gender": userGender]
            
            COLLECTION_USERS.document(self.userSession!.uid).setData(data as [String : Any]) { _ in
                self.userSession = self.userSession
            }
        }
    }
}
