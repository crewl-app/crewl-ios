//
//  Prehome.swift
//  Crewl
//
//  Created by NomoteteS on 6.02.2023.
//

import SwiftUI

struct PrehomeView: View {
    
    @ObservedObject var viewModel : PrehomeViewModel = .init()
    @State var isClickedForRegister = false
    
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            //MARK: - Prehome Background Image
            PrehomeBackground()
            //MARK: - Prehome Continue Button
            ZStack {
                NavigationLink(destination: {
                    viewModel.router.goToLogin()
                        .navigationBarHidden(true)
                }, label: {
                    Text(TextHelper.ButtonText.Continue.rawValue.locale())
                        .font(.SpaceBold13)
                })
                .buttonStyle(PrimaryButtonStyle(buttonColor: Color.CrewlWhite,
                                                buttonWidth: 0.56.dW(),
                                                buttonHeight: 0.07.dH()))
                //MARK: - /
            }
            .position(x: 0.5.dW(),
                      y: WindowUtils.windowType == WindowType.Small ? 0.65.dH() : 0.75.dH())
        }
    }
}


struct PrehomeView_Previews: PreviewProvider {
    static var previews: some View {
        PrehomeView()
    }
}



