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
    
    func getTotalNumber() -> String {
        return code + number
    }
}
