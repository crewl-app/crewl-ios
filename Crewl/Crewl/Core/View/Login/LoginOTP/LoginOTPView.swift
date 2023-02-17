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
    
    @ObservedObject var viewModel : LoginOTPViewModel
    @FocusState var toFocused : Bool
    
    var body: some View {
        GeometryReader { Geo in
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                // MARK: - Text
                VStack(alignment: .leading,spacing: 10) {
                    Text(TextHelper.LoginText.VerificationText.rawValue.locale())
                        .font(.SpaceBold23)
                        .lineLimit(2)
                    Group {
                        Text(viewModel.phoneNumber.getTotalNumber()).font(.system(size: 14, weight: .bold)) +
                        Text(TextHelper.LoginText.SendedCodeNumber.rawValue.locale())
                    }
                    .font(.RoundedRegular14)
                }
                .frame(height: 90)
                .padding()
                // MARK: - OTPTextField
                OTPTextField(otpText: $viewModel.OTPString, wrongCode: $viewModel.isOTPWrong)
                    .onChange(of: viewModel.OTPString, perform: { OTP in
                        if OTP.count == 5 {
                            viewModel.isOTPWrong = false
                        }
                    })
                    .padding(.all)
                    .focused($toFocused)
                
                Spacer()
                
                Group {
                    // MARK: - ReSendCode
                    ReSendCode() {
                        PhoneAuthManager.shared.startAuth(phoneNumber:viewModel.phoneNumber.getTotalNumber()) { _ in }
                    }
                    .padding(.horizontal)
                    .frame(height: 27)
                    .padding(.bottom,Geo.dh(0.01))
                    // MARK: - Buttons
                    HStack(spacing: 18) {
                        
                        BackButton()
                            .buttonStyle(BackButtonStyle())
                        /// Checking positive
                        let status = (viewModel.OTPString.count > 5)
                        // Verifection Button
                        ZStack {
                            PrimaryButton(action: {
                                PhoneAuthManager.shared.verifyCode(smsCode: viewModel.OTPString) { success in
                                    if success {
                                        viewModel.isVerifectionCorrect.toggle()
                                    } else {
                                        viewModel.isOTPWrong = true
                                    }
                                }
                            }, text: TextHelper.ButtonText.Confirm.rawValue,
                                          buttonWidth: Geo.dw(0.686),
                                          buttonHeight: 50)
                            .disabled(status != true)
                            .compositingGroup()
                            .opacity(status ? 1 : 0.5)
                            // Destination
                            NavigationLink(isActive: $viewModel.isVerifectionCorrect) {
                                viewModel.router.goToLoginSuccessView()
                                    .navigationBarHidden(true)
                            } label: {  }
                        }
                    }
                }
                .padding(.bottom,Geo.dh(0.05))
                // MARK: - \\
            }
        }
        .onAppear{ toFocused.toggle() }
    }
}


struct LoginOTPView_Previews: PreviewProvider {
    static var previews: some View {
        LoginOTPView(viewModel: .init(phoneNumber: PhoneNumber(code:"+90",number:"5392469551")))
    }
}

