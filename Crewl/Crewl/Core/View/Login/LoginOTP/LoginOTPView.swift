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
    @FocusState var toFocused : FieldType?
    
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                
                Spacer() // SPACER
                
                VStack(alignment: .leading,spacing: 10) {
                    
                    // MARK: - Text
                    VStack(spacing: 10) {
                        Text(TextHelper.LoginText.VerificationText.rawValue.locale())
                            .font(.SpaceBold23)
                            .lineLimit(2)
                        
                        Group {
                            Text(viewModel.phoneNumber.getTotalNumber()).font(.system(size: 14, weight: .bold)) +
                            Text(TextHelper.LoginText.SendedCodeNumber.rawValue.locale())
                        }
                        .padding(.vertical,5)
                        .font(.RoundedRegular14)
                    }
                    .frame(height: 100)
                    .padding(.all)
                    
                    
                    // MARK: - OTPTextField
                    OTPTextField(otpText: $viewModel.OTPString, wrongCode: $viewModel.isOTPWrong)
                        .onChange(of: viewModel.OTPString, perform: { OTP in
                            if OTP.count == 5 {
                                viewModel.isOTPWrong = false
                            }
                        })
                        .focused($toFocused, equals: .OTP)
                    
                    Spacer() // Spacer
                    
                    // MARK: - ReSendCode
                    ReSendCode() {
                        PhoneAuthManager.shared.startAuth(phoneNumber:viewModel.phoneNumber.getTotalNumber()) { success in
                           
                        }
                        
                    }
                    .padding(.vertical)
                    
                    // MARK: - Button
                    HStack(spacing: 20) {
                        
                        // Back Button
                        BackButton()
                        
                        /// Checking positive
                        let status = (viewModel.OTPString.count > 5)
                        
                        // Verifection Button
                        Group{
                            PrimaryButton(action: {
                                PhoneAuthManager.shared.verifyCode(smsCode: viewModel.OTPString) { success in
                                    if success {
                                        viewModel.isVerifectionCorrect.toggle()
                                    } else {
                                        viewModel.isOTPWrong = true
                                    }
                                }
                                
                            }, text: TextHelper.ButtonText.Confirm.rawValue)
                            .disabled(status != true)
                            .compositingGroup()
                            .opacity(status ? 1 : 0.5)
                            
                            // Destination
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
        LoginOTPView(viewModel: .init(phoneNumber: PhoneNumber(code:"+90",number:"5392469551"), verifectionID: ""))
    }
}

extension LoginOTPView {
    enum FieldType : Hashable {
        case OTP
    }
}
