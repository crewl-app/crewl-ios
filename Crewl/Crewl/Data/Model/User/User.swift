//
//  UserData.swift
//  Crewl
//
//  Created by NomoteteS on 19.02.2023.
//

import FirebaseFirestoreSwift

struct User : Identifiable {
    @DocumentID var id: String?
	var fullname: UserName?
	var phone : UserPhoneNumber?
    var profileImageUrl: String?
	var birthdate: String?
    var gender: String?
}
