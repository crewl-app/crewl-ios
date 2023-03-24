//
//  RegisterItem.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct RegisterGenderItem: Identifiable,Equatable {
    var id = UUID().uuidString
    var genderImage : String
    var genderName : String
}
