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
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                //MARK: - LoginOTP Text
                VStack(alignment: .leading,spacing: 20) {
                    Text(TextHelper.LoginText.VerificationText.rawValue.locale())
                        .font(.SpaceBold23)
                        .lineLimit(2)
                    Group {
                        Text(viewModel.phoneNumber.getTotalNumber()).font(.system(size: 14, weight: .bold)) +
                        Text(TextHelper.LoginText.SendedCodeNumber.rawValue.locale())
                    }
                    .font(.Rounded13)
                }
                .padding(.top,36)
                .padding(.trailing,0.1.dW())
                .frame(width: 0.97.dW(),
                       height: 150)
                
                //MARK: - LoginOTP OTPTextField
                OTPTextField(otpText: $viewModel.OTPString, wrongCode: $viewModel.isOTPWrong)
                    .onChange(of: viewModel.OTPString, perform: { OTP in
                        if OTP.count == 5 {
                            viewModel.isOTPWrong = false
                        }
                    })
                    .padding(.top)
                    .padding(.horizontal,0.05.dW())
                    .focused($toFocused)
                
                //MARK: - LoginOTP Error massage
                HStack {
                    Text("*").foregroundColor(Color.red).font(.system(size: 12, weight: .bold)) +
                    Text("Kod hatalı. Tekrar dene.")
                    Spacer()
                }
                .padding(.top)
                .padding(.leading,0.15.dW())
                .font(.Rounded12)
                
                Spacer()
                
                Group {
                    // MARK: - ReSendCode
                    ReSendCode() {
                        PhoneAuthManager.shared.startAuth(phoneNumber:viewModel.phoneNumber.getTotalNumber()) { _ in }
                    }
                    .padding(.horizontal)
                    .frame(height: 27)
                    .padding(.bottom,0.01.dH())
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
                                          buttonWidth: 0.686.dW())
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
                .padding(.bottom,0.05.dH())
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

