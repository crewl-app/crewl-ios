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
    @ObservedObject var viewModel : LoginNumberViewModel
    @FocusState var keyboardFocused : Bool
        
    var body: some View {
        ZStack {
            
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
                .frame(height: 90)
                .padding()
                
                //MARK: - TextFields
                VStack {
                    HStack {
                        CountryTextField(country: $viewModel.selectedCountryByUser)
                            .onTapGesture {
                                viewModel.isClickedCountryBottomSheet = true
                            }
                        
                        
                        PhoneTextField(number: $viewModel.loginPropertys.userPhone)
                            .focused($keyboardFocused)
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
                
                Spacer() // SPACER

                //MARK: - Pricvacy Policy
                PrivacyPolicy(isCheckMarked: $viewModel.isCheckMarked,
                              isActivatePolicy: $viewModel.isActivatePolicy,
                              isActivateTerms: $viewModel.isActivateTerms)
                    .padding()
                                
                //MARK: - Buttons
                ZStack {
                    HStack(spacing: 20) {
                        
                        BackButton()
                        
                        // Button & Destination
                        Group {
                            /// Checking positive
                            let status = (viewModel.isCheckMarked && viewModel.loginPropertys.userPhone.count > 9)
                            
                            //  Button to OTP screen
                            PrimaryButton(action: {
                                PhoneAuthManager.shared.startAuth(phoneNumber: "\(viewModel.selectedCountryByUser.countryCode)\(viewModel.loginPropertys.userPhone)") { success in
                                    viewModel.isPhoneCorrect.toggle()
                                }
                            }, text: TextHelper.ButtonText.SendVerification.rawValue)
                            .compositingGroup()
                            .opacity(status ? 1 : 0.5)
                            .disabled(status != true)
                        }
                        .frame(alignment: .bottom)
                    }
                    // Destination
                    NavigationLink(isActive: $viewModel.isPhoneCorrect) {
                        let userPhoneNumber = PhoneNumber(code:viewModel.selectedCountryByUser.countryCode,
                                                          number:viewModel.loginPropertys.userPhone)
                        viewModel.router.goToLoginOTPView(phoneNumber: userPhoneNumber,verifectionID: viewModel.verifectionID)
                            .navigationBarBackButtonHidden(true)
                    } label: { }
                }
                // MARK: - \\
            }
            .sheet(isPresented: $viewModel.isClickedCountryBottomSheet ) {
                CountryCodeScreen(countries: $viewModel.countryList,
                                  isClickedCountry: $viewModel.isClickedCountryBottomSheet
                ) { selectedCountry in
                    viewModel.selectedCountryByUser = selectedCountry
                    viewModel.isClickedCountryBottomSheet = false
                }
            }
        }
        .onAppear {
            keyboardFocused = viewModel.isFocusState
               
           }
    }
}

struct LoginNumber_Previews: PreviewProvider {
    static var previews: some View {
        LoginNumberView(viewModel: LoginNumberViewModel( isFocusState: true))
    }
}


