//
//  LoginNumberView.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct LoginNumberView: View {
    
    @StateObject var viewModel : LoginNumberViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.BackgroundColor
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(TextHelper.LoginText.LoginTitle.rawValue.locale())
                        .font(.SpaceBold23)

                    Text(TextHelper.LoginText.LoginDescription.rawValue.locale())
                        .font(.RoundedRegular14)
                        .foregroundColor(Color.CrewlGray)
                }
                .padding()
                
                HStack {
                    
                    CustomCountryTextField()
                    
                    CustomPhoneTextField()
                }

                HStack {
                    Text("* ").foregroundColor(Color.red).font(.system(size: 15)) +
                    Text(TextHelper.LoginText.AttentionMassage.rawValue.locale())
                        .font(.RoundedRegular14)
                        .foregroundColor(Color.CrewlGray)
                }
                .offset(x: 40)
                .frame(width: 240)
                
                Spacer()
                
                PrivacyPolicyView(viewModel: viewModel.pp)
                    .padding()
                
                
                // MARK: - Buttons
                HStack(spacing: 10) {
                    
                    BackButton()
                    
                    Button {
                        
                    } label: {
                        Text(TextHelper.ButtonText.SendVerification.rawValue.locale())
                            .font(.SpaceBold13)
                    }
                    .buttonStyle(PrimaryButtonStyle(buttonColor: viewModel.pp.checkMarked ? Color.CrewlSoftYellow : Color.CrewlGray,
                                                    setWidthAgain: 271))
                    
                    .disabled(viewModel.pp.checkMarked)
                }
                
                Spacer()
            }
        }
    }
}

struct LoginNumber_Previews: PreviewProvider {
    static var previews: some View {
        LoginNumberView()
    }
}
