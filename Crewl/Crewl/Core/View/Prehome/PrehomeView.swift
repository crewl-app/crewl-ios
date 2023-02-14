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
            ZStack {
                Color.CrewlBackgroundColor
                    .ignoresSafeArea()
                
                VStack {
                    
                    
                        Image("preHomeTop")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 1,height: UIScreen.main.bounds.height * 0.27)
                            .padding(.top,UIScreen.main.bounds.width * 0.1)
            
                        Image("preHomeCorners")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width * 1.5,height: UIScreen.main.bounds.height * 0.63)
                }
                .frame(width:  UIScreen.main.bounds.width * 1,height: UIScreen.main.bounds.height * 1)
                
                    
                VStack {
                    Spacer()
                    
                    // MARK: - Logo

                    Spacer()
                    Spacer()
                    
                    
                    // MARK: - Buttons
                    VStack(spacing: 0) {
                        // Login Button
                        NavigationLink {
                            viewModel.router.goToLogin(isKeyboardFocus: true)
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Text(TextHelper.ButtonText.SignIn.rawValue.locale())
                                .font(.SpaceBold13)
                        }
                        .buttonStyle(PrimaryButtonStyle(buttonColor: Color.CrewlWhite,
                                                        setWidthAgain: 220))
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
                            .buttonStyle(PrimaryButtonStyle(buttonColor: Color.CrewlYellow,
                                                            setWidthAgain: 170))
                        }
                    }
                    .padding(.bottom,5)
                    .padding(.bottom)
                    .padding(.horizontal)
                    Spacer()
                }
            }
        }
    
}

struct Prehome_Previews: PreviewProvider {
    static var previews: some View {
        Prehome()
    }
}
