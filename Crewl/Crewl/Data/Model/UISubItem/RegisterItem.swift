//
//  RegisterItem.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct RegisterItem: Identifiable, Equatable {
    var id = UUID().uuidString
    var image : Image
    var gender : String
}
