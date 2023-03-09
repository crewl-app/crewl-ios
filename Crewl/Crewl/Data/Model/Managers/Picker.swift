//
//  Picker.swift
//  Crewl
//
//  Created by NomoteteS on 7.03.2023.
//

import UIKit

enum Picker {
    enum Source: String {
        case gallery, camera
    }
    
    static func checkPermissions() -> Bool {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            return true
        } else {
            return false
        }
    }
}
