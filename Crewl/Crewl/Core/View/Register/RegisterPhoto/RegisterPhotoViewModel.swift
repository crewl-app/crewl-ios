//
//  RegisterPhotoViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

typealias RegisterPhotoPromoter = RegisterPhotoRouter

//TODO: RegisterName ViewModel Benzet
class RegisterPhotoViewModel: ObservableObject {
    
    var router = RegisterPhotoPromoter()
    
    @Published var isReadyToNextView: Bool
    @Published var isShowPicker: Bool
    @Published var userImage: UIImage?
    @Published var source: Picker.Source = .gallery
    
    init(isReadyToNextView: Bool = false,
         isShowPicker: Bool = false,
         userImage: UIImage? = UserModel().profileImageUrl) {
        self.isReadyToNextView = isReadyToNextView
        self.isShowPicker = isShowPicker
        self.userImage = userImage
    }
    //MARK: RegisterPhotoPromoter - Photo Picker Work Func
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
