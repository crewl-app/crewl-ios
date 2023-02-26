//
//  LoginNumberView.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct LoginNumberView: View {
	@ObservedObject var viewModel : LoginNumberViewModel = .init()
	@FocusState var isFocused : Bool

	/* These variables are just flags. You don't modify, just using them for change of the view's state. */
	@State var isCheckMarked : Bool = false
	@State var isPrivacyPolicySheetShown : Bool = false
	@State var isTermsServiceSheetShown : Bool = false
	@State var isCountrySheetShown = false
	/* */

	var body: some View {
		ZStack {
			Color.CrewlBackgroundColor
				.ignoresSafeArea()
			VStack(spacing: 10){
				// MARK: - Header Title & Description
				HeaderContent()

				// MARK: - Phone & Country Code Textfield
				MainContent(
					country: $viewModel.country,
					number: $viewModel.phone.number,
					isClicked: { isClicked in
						self.isCountrySheetShown = isClicked
					},
					isFocused: _isFocused
				)
				.fixedSize(horizontal: false, vertical: true)

				Spacer()

				// MARK: Login Buttons & PP
				Group {
					UserContractView(
						isCheckboxMarked: self.$isCheckMarked,
						isPrivacyPolicyActivated: self.$isPrivacyPolicySheetShown,
						isTermsOfServiceActivated: self.$isTermsServiceSheetShown
					)

					// Buttons Destination
					HStack(spacing: 20) {
						BackButton()

						ZStack {
							// Field regex.
							let status = (self.isCheckMarked && viewModel.phone.number.count > 9)

							// Redirect button to authentication code screen.
							PrimaryButton(text: "Onay Kodu Gönder", isLoading: $viewModel.isLoading) {
								viewModel.startAuth()
							}
							.compositingGroup()
							.opacity(status ? 1 : 0.5)
							.disabled(status != true)

							// Destination
							NavigationLink(isActive: $viewModel.isPhoneCorrect) {
								viewModel.router.navigate(phone: viewModel.phone)
									.navigationBarHidden(true)
							} label: {}
						}
					}
				}
				.padding(.bottom)
			}
			.sheet(isPresented: self.$isCountrySheetShown ) {
				CountryCodeWindow(
					countries: $viewModel.countries,
					isClickedCountry: self.$isCountrySheetShown
				) { selectedCountry in
					viewModel.country = selectedCountry
					self.isCountrySheetShown = false
				}
			}.padding(.all)
		}
		.onAppear {
			isFocused = true
		}
		.onDisappear {
			viewModel.isLoading = false
			isFocused = false
		}
	}
}

private struct HeaderContent: View {
	var body: some View {
		VStack(alignment: .leading, spacing: 15) {
			Text(TextHelper.LoginText.LoginTitle.rawValue.locale())
				.font(.SpaceBold25)

			Text(TextHelper.LoginText.LoginDescription.rawValue.locale())
				.font(.Rounded16)
				.lineLimit(2)
				.minimumScaleFactor(0.8)
				.lineSpacing(5)
				.foregroundColor(Color.CrewlGray)
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		.padding(.vertical)
		.fixedSize(horizontal: false, vertical: true)
	}
}

private struct MainContent: View {
	@Binding var country: Country
	@Binding var number: String
	var isClicked: (Bool) -> Void
	@FocusState var isFocused: Bool
	
	var body: some View {
		VStack {
			HStack {
				CountryTextField(country: $country)
					.onTapGesture {
						isClicked(true)
					}
					.padding(.bottom, 50)

				PhoneTextField(number: $number)
					.focused($isFocused)
			}
			.padding(.horizontal)
		}
	}
}

struct LoginNumber_Previews: PreviewProvider {
	static var previews: some View {
		LoginNumberView().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
			.previewDisplayName("iPhone 14 Pro Max")
			.statusBarHidden(false)
	}
}
