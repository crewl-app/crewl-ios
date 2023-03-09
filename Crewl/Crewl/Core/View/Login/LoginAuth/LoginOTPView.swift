//
//  LoginOTPView.swift
//  Crewl
//
//  Created by NomoteteS on 8.02.2023.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct LoginOTPView: View {
	@ObservedObject var viewModel : LoginOTPViewModel = .init()
	@FocusState var isFocused : Bool

	var phone : UserPhoneNumber
	
	var body: some View {
		ZStack {
			Color.CrewlBackgroundColor
				.ignoresSafeArea()
			VStack(spacing: 10) {
				//MARK: LoginOTPView - LoginOTP Text
				OTPHeaderContent(number: phone.fullNumber)
				
				//MARK: LoginOTPView - LoginOTP OTPTextField
				OTPTextField(otpText: $viewModel.code, wrongCode: $viewModel.isCodeWrong)
					.onChange(of: viewModel.code, perform: { OTP in
						if OTP.count == 5 {
							viewModel.isCodeWrong = false
						}
					})
					.padding(.horizontal)
					.frame(width: UIScreen.main.bounds.width * 0.9)
					.fixedSize(horizontal: false, vertical: true)
					.focused($isFocused)

				HStack {
					Text("* ").foregroundColor(Color.red).font(.system(size: 15)) +
					Text("Kod hatalı, tekrar dene.")
						.font(.Rounded13)
						.foregroundColor(Color.CrewlGray)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				.opacity(viewModel.isCodeWrong ? 1 : 0)
				.minimumScaleFactor(0.8)
				.padding(.top, 10)
				
				Spacer()
				
				Group {
					//MARK: LoginOTPView - ResendCodeView
					ResendCodeView() {
						viewModel.startAuth(phone: self.phone.fullNumber)
					}
					.frame(height: 27)
					//MARK: LoginOTPView - Buttons
					HStack(spacing: 20) {
						BackButton {
							viewModel.reset()
						}
						let status = (viewModel.code.count > 5)
						ZStack {
							// Redirect button to authentication code screen.
							PrimaryButton(text: "Onayla", isLoading: $viewModel.isLoading) {
								viewModel.verifyCode()
							}
							.disabled(status != true)
							.compositingGroup()
							.opacity(status ? 1 : 0.5)

							// Destination
							NavigationLink(isActive: $viewModel.isVerificationCorrect) {
								viewModel.router.navigate()
									.navigationBarHidden(true)
							} label: {}
						}
					}
				}
				.padding(.bottom)
			}
			.padding(.all)
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



private struct MainContent: View {
	@State var viewModel: LoginOTPViewModel
	@FocusState var toFocused : Bool

	var body: some View {
		OTPTextField(otpText: $viewModel.code, wrongCode: $viewModel.isCodeWrong)
			.onChange(of: viewModel.code, perform: { OTP in
				if OTP.count == 5 {
					viewModel.isCodeWrong = false
				}
			})
			.frame(width: UIScreen.main.bounds.width * 0.9)
			.focused($toFocused)
	}
}

struct LoginOTPView_Previews: PreviewProvider {
	static var previews: some View {
		LoginOTPView(phone: UserPhoneNumber(code: "+90", number: "5324409818"))
	}
}

