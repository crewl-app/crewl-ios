//
//  ImageUploadManager.swift
//  Crewl
//
//  Created by NomoteteS on 9.03.2023.
//

import UIKit
import FirebaseStorage

struct ImageUploaderManager {
    static func uploadImage(image: UIImage, completetion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/prifle_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload images\(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completetion(imageUrl)
            }
        }
    }
}
