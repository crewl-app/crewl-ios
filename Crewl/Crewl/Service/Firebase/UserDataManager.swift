//
//  UserDataManager.swift
//  Crewl
//
//  Created by NomoteteS on 9.03.2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class UserDataManager: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = UserDataManager()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func regsiter(name: String,
                  surname: String,
                  phone: String,
                  image: UIImage?,
                  birthdate: String,
                  gender: String) {
        
        guard let image = image else { return }
        
        ImageUploaderManager.uploadImage(image: image) { imageUrl in
            let data = ["name": name,
                        "surname": surname,
                        "phone": phone,
                        "imageUrl": imageUrl,
                        "birthdate": birthdate,
                        "gender": gender,
                        "uid": self.userSession?.uid]
            
            COLLECTION_USERS.document(self.userSession!.uid).setData(data as [String : Any]) { _ in
                self.userSession = self.userSession
            }
        }
    }
}
