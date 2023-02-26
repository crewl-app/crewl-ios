//
//  UserData.swift
//  Crewl
//
//  Created by NomoteteS on 19.02.2023.
//

import Foundation

struct User : Identifiable {
	var id: String = UUID().uuidString
	var name: (first: String, last: String)?
	var phone : PhoneNumber?
	var birthdate: String?

	var fullName: String {
		if let name = name {
			return "\(name.first) \(name.last)"
		} else {
			return ""
		}
	}
}
