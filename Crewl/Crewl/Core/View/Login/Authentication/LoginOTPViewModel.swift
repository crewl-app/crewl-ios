//
//  LoginOTPViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import Foundation
import FirebaseAuth

typealias LoginOTPRouterPromoter = LoginOTPRouter

class LoginOTPViewModel: ObservableObject {
    var router = LoginOTPRouterPromoter()
    
    @Published var code : String
    @Published var isCodeWrong : Bool

    @Published var isVerificationCorrect : Bool
	@Published var isLoading: Bool = false

    init(code: String = "",
		 isCodeWrong: Bool = false,
		 isVerificationCorrect : Bool = false) {
        self.code = code
        self.isCodeWrong = isCodeWrong
        self.isVerificationCorrect = isVerificationCorrect
    }

	func verifyCode() {
		self.isLoading = true

		DispatchQueue.main.asyncAfter(deadline: .now() + ASYNC_DELAY_MEDIUM) {
			PhoneAuthManager.shared.verifyCode(code: self.code) { success in
                if success {
                    self.isVerificationCorrect = true
                } else {
                    self.isCodeWrong = true
                }
				self.isLoading = false
			}
		}
	}

	func startAuth(phone: String) {
		self.isLoading = true

		DispatchQueue.main.asyncAfter(deadline: .now() + ASYNC_DELAY_MEDIUM) {
			PhoneAuthManager.shared.startAuth(number: phone) { _ in }

			self.code = ""
			self.isLoading = false
		}
	}

	func reset() {
		DispatchQueue.main.asyncAfter(deadline: .now() + ASYNC_DELAY_SMALL) {
			self.code = ""
			self.isLoading = false
		}
	}
}
