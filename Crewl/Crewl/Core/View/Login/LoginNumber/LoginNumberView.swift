//
//  LoginNumberView.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct LoginNumberView: View {
    @ObservedObject var viewModel : LoginNumberViewModel
    @FocusState var toFocused : FieldType?
    
    @State private var isCountryBottomSheetShown = false
    
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
                .padding(.vertical)
                .padding(.top)
                
                //MARK: - TextFields
                VStack {
                    HStack {
                        CountryTextField(country: .constant(viewModel.selectedCountryByUser))
                            .onTapGesture {
                                viewModel.isClickedCountryBottomSheet = true
                                isCountryBottomSheetShown = true
                            }
                        
                        PhoneTextField(number: $viewModel.loginPropertys.userPhone)
                            .focused($toFocused, equals: .phoneNumber)
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
                
                PrivacyPolicy(isCheckMarked: $viewModel.isCheckMarked,
                              isActivatePolicy: $viewModel.isActivatePolicy,
                              isActivateTerms: $viewModel.isActivateTerms)
                    .padding()
                
                Spacer() // SPACER
                
                // MARK: - Buttons
                HStack(spacing: 20) {
                    
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
                                                        backButtonColor: status ? Color.CrewlBlack : Color.CrewlSoftBlack,
                                                        setWidthAgain: 271))
                        
                        // Destination
                        NavigationLink(isActive: $viewModel.isPhoneCorrect) {
                            let userPhoneNumber = PhoneNumber(code:viewModel.selectedCountryByUser.countryCode,
                                                              number:viewModel.loginPropertys.userPhone)
                            
                            viewModel.router.goToLoginOTPView(phoneNumber: userPhoneNumber)
                                .navigationBarBackButtonHidden(true)
                        } label: { }
                    }
                    .padding(.vertical)
                    // MARK: - \\
                }
              
            }
            .sheet(isPresented: $isCountryBottomSheetShown) {
                CountryCodeScreen(countries: $viewModel.countryList,
                                  isClickedCountry: $viewModel.isClickedCountryBottomSheet
                ) { selectedCountry in
                    viewModel.selectedCountryByUser = selectedCountry
                    isCountryBottomSheetShown = false
                }
            }
        }
        .onAppear{
            toFocused = .phoneNumber
        }
    }
}

struct LoginNumber_Previews: PreviewProvider {
    static var previews: some View {
        LoginNumberView(viewModel: LoginNumberViewModel())
    }
}

extension LoginNumberView {
    enum FieldType : Hashable {
        case phoneNumber
    }
}
