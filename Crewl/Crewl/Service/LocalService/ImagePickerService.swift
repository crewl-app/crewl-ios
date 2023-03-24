//
//  ImagePickerService.swift
//  Crewl
//
//  Created by NomoteteS on 6.03.2023.
//

import SwiftUI

struct ImagePickerService: UIViewControllerRepresentable{
    
    @Environment(\.dismiss) var dismiss
    
    var sourceType : UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePickerService
        
        init(_ parent: ImagePickerService) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.dismiss()
        }
    }
}
