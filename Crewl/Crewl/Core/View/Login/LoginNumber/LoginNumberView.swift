//
//  LoginNumberView.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct LoginNumberView: View {
    
    @ObservedObject var viewModel : LoginNumberViewModel = .init()
    @FocusState var toFocused : Bool
    
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack{
                //MARK: - Text
                VStack(alignment: .leading, spacing: 10) {
                    Text(TextHelper.LoginText.LoginTitle.rawValue.locale())
                        .font(.SpaceBold23)
                    Text(TextHelper.LoginText.LoginDescription.rawValue.locale())
                        .font(.Rounded13)
                        .foregroundColor(Color.CrewlGray)
                }
                .padding(.top,36)
                .padding(.trailing)
                .frame(width: 0.97.dW(),
                       height: 150)
                //MARK: - Login TextFields
                VStack {
                    HStack {
                        CountryTextField(country: $viewModel.selectedCountryByUser)
                            .onTapGesture {
                                viewModel.isClickedCountryBottomSheet = true
                            }
                        PhoneTextField(number: $viewModel.loginPropertys.userPhone)
                            .focused($toFocused)
                    }
                    //MARK: - Login Attentions
                    HStack {
                        Text("* ").foregroundColor(Color.red).font(.system(size: 15)) +
                        Text(TextHelper.LoginText.AttentionMassage.rawValue.locale())
                            .font(.Rounded13)
                            .foregroundColor(Color.CrewlGray)
                    }
                    .offset(x: 40)
                    .frame(width: 0.6.dW(),
                           height: 40)
                }
                .padding(.top)
                
                Spacer()
                
                // MARK: Login Buttons & PP
                Group {
                    //Privacy Policy
                    PrivacyPolicy(isCheckMarked: $viewModel.isCheckMarked,
                                  isActivatePolicy: $viewModel.isActivatePolicy,
                                  isActivateTerms: $viewModel.isActivateTerms)
                    .padding()
                    //Buttons Destination
                    HStack(spacing: 20) {
                        BackButton()
                            .buttonStyle(BackButtonStyle())
                        ZStack {
                            /// Checking positive
                            let status = (viewModel.isCheckMarked && viewModel.loginPropertys.userPhone.count > 9)
                            //  Button to OTP screen
                            PrimaryButton(action: {
                                PhoneAuthManager.shared.startAuth(phoneNumber: "\(viewModel.selectedCountryByUser.countryCode)\(viewModel.loginPropertys.userPhone)") { success in
                                    viewModel.isPhoneCorrect.toggle()
                                }
                            }, text: TextHelper.ButtonText.SendVerification.rawValue,
                                          buttonWidth: 0.76.dW())
                            .compositingGroup()
                            .opacity(status ? 1 : 0.5)
                            .disabled(status != true)
                            // Destination
                            NavigationLink(isActive: $viewModel.isPhoneCorrect) {
                                let userPhoneNumber = PhoneNumber(code:viewModel.selectedCountryByUser.countryCode,
                                                                  number:viewModel.loginPropertys.userPhone)
                                viewModel.router.goToLoginOTPView(phoneNumber: userPhoneNumber)
                                    .navigationBarHidden(true)
                            } label: { }
                        }
                    }
                }
                .padding(.bottom,20)
                // MARK: - \\
            }
            .sheet(isPresented: $viewModel.isClickedCountryBottomSheet ) {
                CountryCodeScreen(countries: $viewModel.countryList,
                                  isClickedCountry: $viewModel.isClickedCountryBottomSheet)
                { selectedCountry in
                    viewModel.selectedCountryByUser = selectedCountry
                    viewModel.isClickedCountryBottomSheet = false
                }
            }
        }
        .onAppear { toFocused.toggle() }
    }
}

struct LoginNumber_Previews: PreviewProvider {
    static var previews: some View {
        LoginNumberView()
    }
}
