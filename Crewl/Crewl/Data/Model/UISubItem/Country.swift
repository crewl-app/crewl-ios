//
//  Country.swift
//  Crewl
//
//  Created by Kaan on 12.02.2023.
//

import Foundation

struct Country: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var dialogCode: String
    var countryCode: String
    var flag: String
}
