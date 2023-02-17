//
//  Prehome.swift
//  Crewl
//
//  Created by NomoteteS on 6.02.2023.
//

import SwiftUI

struct Prehome: View {
    
    @ObservedObject var viewModel : PrehomeViewModel = .init()
    @State var isClickedForRegister = false
    @State var isClickedForLogin = false
    var calculatedHeight = 0.0

//    mutating func getWindowType() {
//        
//        if WindowUtils.screenHeight == .Small {
//            self.calculatedHeight = 1.0
//        } else {
//            self.calculatedHeight = 1.05
//        }
//        
//    }
    
    var body: some View {
        GeometryReader { Geo in
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            //MARK: - Background Image
            VStack {
                if Geo.dh(1) < 648.0 {
                    Image.preHomeImage
                        .resizable()
                        .frame(width:  1.0.toWidthDim(),
                               height: 1.0.toHeightDim())
                }
//                else {
//                    Image.preHomeImage
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width:  Geo.dw(1),
//                               height: Geo.dh(1.05))
//                }
            }
            //MARK: - Buttons
            VStack(spacing: 0) {
                // Login Button
                PrimaryButton(action: {
                    isClickedForLogin.toggle()
                }, text: TextHelper.ButtonText.SignIn.rawValue,
                              buttonWidth: Geo.dw(0.56),
                              buttonHeight: Geo.dh(0.058),
                              buttonColor: Color.CrewlWhite)
                .padding(.vertical)
                // Register Button
                PrimaryButton(action: {
                    isClickedForRegister.toggle()
                }, text: TextHelper.ButtonText.SignUp.rawValue,
                              buttonWidth: Geo.dw(0.56),
                              buttonHeight: Geo.dh(0.058))
                
                NavigationLink(isActive: $isClickedForRegister) {
                    viewModel.router.goToRegister()
                        .navigationBarBackButtonHidden(true)
                } label: { }
                //MARK: - /
            }
            .fullScreenCover(isPresented: $isClickedForLogin, content: {
                NavigationView {
                    viewModel.router.goToLogin()
                        .navigationBarHidden(true)
                }
            })
            .fullScreenCover(isPresented: $isClickedForRegister, content: {
                NavigationView {
                    viewModel.router.goToRegister()
                        .navigationBarHidden(true)
                }
            })
            .position(x: Geo.dw(0.5),
                      y: Geo.dh(0.7))
        }
    }
}


struct Prehome_Previews: PreviewProvider {
    static var previews: some View {
        Prehome()
    }
}
