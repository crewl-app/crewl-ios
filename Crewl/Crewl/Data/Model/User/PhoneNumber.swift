//
//  PhoneNumber.swift
//  Crewl
//
//  Created by Kaan on 12.02.2023.
//

import Foundation

struct PhoneNumber {
    var code : String
    var number: String
    
	var fullNumber:  String {
        return code + number
    }
}
