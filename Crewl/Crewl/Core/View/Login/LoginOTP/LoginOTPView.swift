//
//  LoginOTPView.swift
//  Crewl
//
//  Created by NomoteteS on 8.02.2023.
//

import SwiftUI

struct LoginOTPView: View {
    
    @ObservedObject var viewModel : LoginOTPViewModel
    @FocusState var toFocused : FieldType?
    
    var body: some View {
        ZStack {
            Color.BackgroundColor
                .ignoresSafeArea()
            VStack {
                
                Spacer() // SPACER
                
                VStack(alignment: .leading,spacing: 10) {
                    
                    // MARK: - Text
                    VStack(spacing: 10) {
                        Text(TextHelper.LoginText.VerificationText.rawValue.locale())
                            .font(.SpaceBold23)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        
                        Group {
                            Text(viewModel.phoneNumber.getTotalNumber()).font(.system(size: 14, weight: .bold)) +
                            Text(TextHelper.LoginText.SendedCodeNumber.rawValue.locale())
                            
                        }
                        .font(.RoundedRegular14)
                        .padding(.trailing)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    
                    // MARK: - OTPTextField
                    OTPTextField(otpText: $viewModel.OTPString, wrongCode: $viewModel.isOTPWrong)
                        .focused($toFocused, equals: .OTP)
                        .padding(.vertical)
                    
                    Spacer() // Spacer
                    
                    // MARK: - ReSendCode
                    ReSendCode() {
                        PhoneAuthManager.shared.startAuth(phoneNumber: viewModel.phoneNumber.number) { success in
                        }
                    }
                    .padding(.vertical)
                    
                    // MARK: - Button
                    HStack(spacing: 20) {
                        
                        BackButton()
                        
                        let status = (viewModel.OTPString.count > 5)
                        
                        Group{
                            Button {
                                PhoneAuthManager.shared.verifyCode(smsCode: viewModel.OTPString) { success in
                                    if success {
                                        viewModel.isVerifectionCorrect.toggle()
                                    } else {
                                        viewModel.isOTPWrong.toggle()
                                    }
                                }
                            } label: {
                                Text(TextHelper.ButtonText.Confirm.rawValue.locale())
                                    .font(.SpaceBold13)
                            }
                            .disabled(status != true)
                            .buttonStyle(PrimaryButtonStyle(buttonColor: status ? Color.CrewlYellow : Color.CrewlSoftYellow,
                                                            backButtonColor: status ? Color.CrewlBlack : Color.CrewlSoftBlack,
                                                            setWidthAgain: 265))
                            
                            NavigationLink(isActive: $viewModel.isVerifectionCorrect) {
                                viewModel.router.goToLoginSuccessView()
                                    .navigationBarBackButtonHidden(true)
                            } label: {  }
                        }
                        // MARK: - \\
                    }
                    .padding(.bottom)
                    .padding(.leading)
                    
                    
                }
                .padding(.horizontal)
            }
            .onAppear{
                toFocused = .OTP
            }
        }
    }
}

struct LoginOTPView_Previews: PreviewProvider {
    static var previews: some View {
        LoginOTPView(viewModel: .init(phoneNumber: PhoneNumber(code:"",number:"")))
    }
}

extension LoginOTPView {
    enum FieldType : Hashable {
        case OTP
    }
}
