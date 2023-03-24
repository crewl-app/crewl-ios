//
//  LoginNumberViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import Foundation
import SwiftUI
import FirebaseAuth

typealias LoginNumberRouterPromoter = LoginNumberRouter
//TODO: RegisterName ViewModel Benzet
class LoginNumberViewModel : ObservableObject {
	lazy var countries: [Country] = CountryListData.countries

	var router = LoginNumberRouterPromoter()

	@Published var country : Country
	@Published var phone : UserPhoneNumberModel

	/* State flags. */
	@Published var isPhoneCorrect : Bool = false
	@Published var isLoading: Bool = false

	init(country: Country = HolderData.defaultCountry,
		 phone: UserPhoneNumberModel = UserPhoneNumberModel(code: "", number: ""),
		 router: LoginNumberRouterPromoter = LoginNumberRouterPromoter()
	) {
		self.country = country
		self.router = router
		self.phone = phone
	}

	func startAuth() {
		self.isLoading = true

		DispatchQueue.main.asyncAfter(deadline: .now() + ASYNC_DELAY_MEDIUM) {
			self.phone.code = self.country.countryCode
			PhoneAuthManager.shared.startAuth(number: self.phone.fullNumber) { success in
				self.isPhoneCorrect = true
			}
			self.isLoading = false
		}
	}

	func reset() {
		DispatchQueue.main.asyncAfter(deadline: .now() + ASYNC_DELAY_SMALL) {
			self.phone.number = ""
			self.isLoading = false
		}
	}
}

// TODO: Change default country depends by local country of phone.
extension LoginNumberViewModel {
	struct HolderData {
		static var defaultCountry = Country(name: "Turkey",
                                            dialogCode: "TR",
                                            countryCode: "+90",
                                            flag: "🇹🇷")
	}
}

