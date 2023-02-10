//
//  LoginOTPView.swift
//  Crewl
//
//  Created by NomoteteS on 8.02.2023.
//

import SwiftUI

struct LoginOTPView: View {
    
    @ObservedObject var viewModel : LoginOTPViewModel
    
    var body: some View {
        ZStack {
            Color.BackgroundColor
                .ignoresSafeArea()
            VStack {
                
                Spacer() // SPACER
                
                // MARK: - Text
                VStack(alignment: .leading,spacing: 10) {
                    Text(TextHelper.LoginText.VerificationText.rawValue.locale())
                        .font(.SpaceBold23)
                    
                    Group{
                        Text("+90\(viewModel.number)") +
                        Text(TextHelper.LoginText.SendedCodeNumber.rawValue.locale())
                    }
                        .font(.RoundedRegular14)
                    
                    // MARK: - OTPTextField
                    CustomOTPTextField(otpText: $viewModel.OTPString, wrongCode: $viewModel.isOTPWrong)
                        .padding(.vertical)
                    
                    // MARK: - ReSendCode
                    ReSendCode(launchTimer: $viewModel.isReSended) {
                        if viewModel.isReSended {
                            PhoneAuthManager.shared.startAuth(phoneNumber: viewModel.number) { success in
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    Spacer() // SPACER
                    
                    // MARK: - Button
                    HStack(spacing: 20) {
                        
                        BackButton()
                        
                        let status = (viewModel.OTPString.count > 5)
                        
                        Group{
                            Button {
                                PhoneAuthManager.shared.verifyCode(smsCode: viewModel.OTPString) { success in
                                    viewModel.isVerifectionCorrect.toggle()
                                }
                            } label: {
                                Text(TextHelper.ButtonText.Confirm.rawValue.locale())
                                    .font(.SpaceBold13)
                            }
                            .disabled(status != true)
                            .buttonStyle(PrimaryButtonStyle(buttonColor: Color.CrewlYellow, setWidthAgain: 265))
                            
                            NavigationLink(isActive: $viewModel.isVerifectionCorrect) {
                                viewModel.router.goToLoginSuccessView()
                                    .navigationBarBackButtonHidden(true)
                            } label: {  }
                        }
                        // MARK: - \\
                    }
                    
                    Spacer() // SPACER
                    
                }
            }
            .padding(.horizontal)
        }
    }
}

struct LoginOTPView_Previews: PreviewProvider {
    static var previews: some View {
        LoginOTPView(viewModel: .init(number: ""))
    }
}
