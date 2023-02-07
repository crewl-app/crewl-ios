//
//  Prehome.swift
//  Crewl
//
//  Created by NomoteteS on 6.02.2023.
//

import SwiftUI

struct Prehome: View {
    
    @ObservedObject var viewModel : PrehomeViewModel = .init(activatedRegister: false, activatedLogin: false)
    
    
    var body: some View {
        ZStack {
            Color.BackgroundColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                // MARK: - Logo
                Image.CrewlLogo
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.4,
                           height: UIScreen.main.bounds.height * 0.15)
                Spacer()
                
                // MARK: - Button
                VStack {
                    Button {
                        viewModel.activatedLogin = true
                    } label: {
                        Text(TextHelper.ButtonText.SignIn.rawValue.locale())
                            .font(.SpaceBold13)
                    }
                    .buttonStyle(PrimaryButtonStyle(buttonColor: Color.CrewlWhite, setWidthAgain: 272))
                    .padding(.vertical)
                    
                    HStack(spacing: 17) {
                      
                        BackButton()
                
                        Button {
                            viewModel.activatedRegister = true
                        } label: {
                            Text(TextHelper.ButtonText.SignUp.rawValue.locale())
                                .font(.SpaceBold13)
                        }
                        .buttonStyle(PrimaryButtonStyle(buttonColor: Color.CrewlYellow, setWidthAgain: 215))

                    }
                }
                .padding(.horizontal)
                
                Spacer()

            }
        }
        .fullScreenCover(isPresented: $viewModel.activatedLogin) {
                viewModel.router.goToLogin()
        }
        .fullScreenCover(isPresented: $viewModel.activatedRegister) {
            viewModel.router.goToRegister()
        }
    }
}

struct Prehome_Previews: PreviewProvider {
    static var previews: some View {
        Prehome()
    }
}
