//
//  LoginOTPViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import Foundation
import FirebaseAuth

typealias LoginOTPRouterPromoter = LoginOTPRouter
//TODO: RegisterName ViewModel Benzet
class LoginOTPViewModel: ObservableObject {
    var router = LoginOTPRouterPromoter()
    
    @Published var code : String
    @Published var isCodeWrong : Bool    
    @Published var isVerificationCorrect : Bool
    @Published var isShouldUserRegister: Bool
	@Published var isLoading: Bool = false

    init(code: String = "",
		 isCodeWrong: Bool = false,
		 isVerificationCorrect : Bool = false,
         isShouldUserRegister : Bool = false) {
        self.code = code
        self.isCodeWrong = isCodeWrong
        self.isVerificationCorrect = isVerificationCorrect
        self.isShouldUserRegister = isShouldUserRegister
    }
    //MARK: LoginOTPViewModel - Checking OTP Code
    func verifyCode(phoneNumber: String) {
		self.isLoading = true
		DispatchQueue.main.asyncAfter(deadline: .now() + ASYNC_DELAY_MEDIUM) {
			PhoneAuthManager.shared.verifyCode(code: self.code) { success in
                if success {
                    //is User have phoneNumber in Firebase
                    COLLECTION_USERS.whereField("phoneNumber", isEqualTo: phoneNumber).getDocuments { snapShot, error in
                        if (snapShot != nil) {
                            self.isVerificationCorrect = true
                        } else {
                            self.isShouldUserRegister = true
                        }
                    }
                } else {
                    self.isCodeWrong = true
                }
				self.isLoading = false
			}
		}
	}
    //MARK: LoginOTPViewModel - Authing
	func startAuth(phone: String) {
		self.isLoading = true

		DispatchQueue.main.asyncAfter(deadline: .now() + ASYNC_DELAY_MEDIUM) {
			PhoneAuthManager.shared.startAuth(number: phone) { _ in }

			self.code = ""
			self.isLoading = false
		}
	}
    //MARK: LoginOTPViewModel - Reset Code
	func reset() {
		DispatchQueue.main.asyncAfter(deadline: .now() + ASYNC_DELAY_SMALL) {
			self.code = ""
			self.isLoading = false
		}
	}
}
