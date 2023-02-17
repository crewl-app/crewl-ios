//
//  LoginSuccessView.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import SwiftUI

struct LoginSuccessView: View {
    
    @ObservedObject var viewModel : LoginSuccessViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                VStack(spacing: 36) {
                    // MARK: - Image
                    Image.LoginSuccess
                        .resizable()
                        .frame(width: 282, height: 325)
                    
                    // MARK: - Text
                    VStack(spacing: 20) {
                        Text(TextHelper.LoginText.ConfirmInLastLogin.rawValue.locale())
                            .font(.SpaceBold23)
                        
                        Text(TextHelper.LoginText.NextToPageInLastLogin.rawValue.locale())
                            .font(.RoundedBold18)
                            .offset(x: UIScreen.main.bounds.width * -0.1)
                    }
                }
                .padding(.trailing, UIScreen.main.bounds.width * 0.3)
                
                Spacer()
                
                // MARK: - Button
//                NavigationLink {
//                    viewModel.router.goToHomeView()
//                        .navigationBarBackButtonHidden(true)
//                } label: {
//                    Text(TextHelper.ButtonText.Continue.rawValue.locale())
//                        .font(.SpaceBold13)
//                }
//                .buttonStyle(PrimaryButtonStyle(buttonColor: Color.CrewlYellow,
//                                                buttonWidth: 321))
                // MARK: - \\
                Spacer()
            }
        }
    }
}

struct LoginSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSuccessView()
    }
}
