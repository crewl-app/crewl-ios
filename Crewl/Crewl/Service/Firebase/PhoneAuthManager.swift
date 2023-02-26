//
//  MobileAuthManager.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import Foundation
import FirebaseAuth

class PhoneAuthManager {
    static let shared = PhoneAuthManager()
    
    private let auth = Auth.auth()
    
    var verificationId: String?
    
    public func startAuth(number: String, completion: @escaping (Bool) -> Void) {
        
//        auth.settings?.isAppVerificationDisabledForTesting = 
        
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { [weak self] verificationId, error in
            guard let verificationId = verificationId, error == nil else {
                completion(false)
                print("Verify Phone :\(error?.localizedDescription ?? "Verify Phone : Error")")
                return
            }
            self!.verificationId = verificationId
            completion(true)
        }
    }
    
    public func verifyCode(code: String, completion: @escaping (Bool) -> Void) {
        guard let verificationId = verificationId else {
            completion(false)
            return
        }
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId,
                                                                 verificationCode: code)
        auth.signIn(with: credential) { result, error in
            guard result != nil, error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
}
