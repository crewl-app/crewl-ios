//
//  LoginNumberView.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct LoginNumberView: View {
    
    @ObservedObject var viewModel : LoginNumberViewModel
    
    var body: some View {
        ZStack {
            Color.BackgroundColor
                .ignoresSafeArea()
            VStack {
                //MARK: - Text
                VStack(alignment: .leading, spacing: 10) {
                    Text(TextHelper.LoginText.LoginTitle.rawValue.locale())
                        .font(.SpaceBold23)
                    
                    Text(TextHelper.LoginText.LoginDescription.rawValue.locale())
                        .font(.RoundedRegular14)
                        .foregroundColor(Color.CrewlGray)
                }
                .frame(height: 90)
                .padding()
                
                //MARK: - TextFields
                VStack {
                    HStack {
                        
                        CustomCountryTextField()
                        
                        CustomPhoneTextField(number: $viewModel.loginPropertys.userPhone)
                    }
                    //MARK: - Attentions
                    HStack {
                        Text("* ").foregroundColor(Color.red).font(.system(size: 15)) +
                        Text(TextHelper.LoginText.AttentionMassage.rawValue.locale())
                            .font(.RoundedRegular14)
                            .foregroundColor(Color.CrewlGray)
                    }
                    .offset(x: 40)
                    .frame(width: 240)
                }
                
                PrivacyPolicy(checkMarked: $viewModel.isCheckMarked, activatePolicy: $viewModel.isActivatePolicy, activateTerms: $viewModel.isActivateTerms )
                    .padding()
                
                Spacer() // SPACER
                
                // MARK: - Buttons
                HStack(spacing: 10) {
                    
                    BackButton()
                    
                    // Button & Destination
                    Group {
                        /// Checking positive
                        let status = (viewModel.isCheckMarked && viewModel.loginPropertys.userPhone.count > 9)
                        
                        // Button
                        Button {
                            PhoneAuthManager.shared.startAuth(phoneNumber: viewModel.loginPropertys.userPhone) { success in
                                    viewModel.isPhoneCorrect.toggle()
                            }
                        } label: {
                            Text(TextHelper.ButtonText.SendVerification.rawValue.locale())
                                .font(.SpaceBold13)
                        }
                        .disabled(status != true)
                        .buttonStyle(PrimaryButtonStyle(buttonColor: status ? Color.CrewlYellow : Color.CrewlSoftYellow,
                                                        setWidthAgain: 271))
                        
                        // Destination
                        NavigationLink(isActive: $viewModel.isPhoneCorrect) {
                            viewModel.router.goToLoginOTPView(number: viewModel.loginPropertys.userPhone)
                                .navigationBarBackButtonHidden(true)
                        } label: { }
                    }
                    // MARK: - \\
                }
                Spacer()// SPACER
            }
        }
    }
}

struct LoginNumber_Previews: PreviewProvider {
    static var previews: some View {
        LoginNumberView(viewModel: LoginNumberViewModel())
    }
}
