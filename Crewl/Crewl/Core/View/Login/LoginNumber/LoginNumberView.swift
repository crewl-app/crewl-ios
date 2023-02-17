//
//  LoginNumberView.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct LoginNumberView: View {
    
    @ObservedObject var viewModel : LoginNumberViewModel = .init()
    @FocusState var toFocused : Bool
    
    var body: some View {
        GeometryReader { Geo in
            Color.CrewlBackgroundColor
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
                .frame(width: Geo.dw(0.91),
                       height: 85)
                //MARK: - TextFields
                VStack {
                    HStack {
                        CountryTextField(country: $viewModel.selectedCountryByUser)
                            .onTapGesture {
                                viewModel.isClickedCountryBottomSheet = true
                            }
                        PhoneTextField(number: $viewModel.loginPropertys.userPhone)
                            .focused($toFocused)
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
                .padding()
                
                Spacer()
                
                // MARK: Buttons & PP
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
                                          buttonWidth: Geo.dw(0.76),
                                          buttonHeight: 50)
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
                .padding(.bottom,Geo.dh(0.05))
                // MARK: - \\
            }
            .position(x: Geo.dpx(0.5),
                      y: Geo.dpy(0.5))
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
