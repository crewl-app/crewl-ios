//
//  RegisterPhotoViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

class RegisterPhotoViewModel: ObservableObject {
    
    @Published var userImage: UIImage?
    @Published var isShowPicker: Bool
    @Published var source: Picker.Source = .gallery
    
    init(userImage: UIImage? = UIImage(),
         isShowPicker: Bool = false) {
        self.userImage = userImage
        self.isShowPicker = isShowPicker
    }
    
    func showPhotoPicker() {
        if source == .camera {
            if Picker.checkPermissions() {
                print("No Camera Access")
                return
            }
        }
        isShowPicker.toggle()
    }
}
