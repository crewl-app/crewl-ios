//
//  Prehome.swift
//  Crewl
//
//  Created by NomoteteS on 6.02.2023.
//

import SwiftUI

struct Prehome: View {
    
    @ObservedObject var viewModel : PrehomeViewModel = .init()
    
    var body: some View {
        NavigationView {
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
                    
                    // MARK: - Buttons
                    VStack {
                        // Login Button
                        NavigationLink {
                            viewModel.router.goToLogin()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Text(TextHelper.ButtonText.SignIn.rawValue.locale())
                                .font(.SpaceBold13)
                        }
                        .buttonStyle(PrimaryButtonStyle(buttonColor: Color.CrewlWhite, setWidthAgain: 272))
                        .padding(.vertical)
                        
                        // Back & Register Buttons
                        HStack(spacing: 17) {
                            BackButton()
                    
                            NavigationLink{
                                viewModel.router.goToRegister()
                                    .navigationBarBackButtonHidden(true)
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
        }
    }
}

struct Prehome_Previews: PreviewProvider {
    static var previews: some View {
        Prehome()
    }
}
