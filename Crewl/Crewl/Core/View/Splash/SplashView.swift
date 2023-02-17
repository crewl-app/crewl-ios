//
//  SplashView.swift
//  Crewl
//
//  Created by NomoteteS on 4.02.2023.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel : SplashViewModel = .init()
    
    var body: some View {
        if viewModel.isActive {
            viewModel.router.goToOnboarding()
        } else {
            // MARK: - Splash showing
            GeometryReader { Geo in
                ZStack{
                    Color.CrewlYellow
                        .ignoresSafeArea()
                    
                    Image.appLogo
                        .resizable()
                        .frame(width: Geo.dw(0.5 / 2),
                               height: Geo.dh(0.5 / 2.5))
                }
                .onChange(of: Geo.size) { newSize in
                    
                    self.setDim(width: Geo.size.width, height: Geo.size.height)
                }
            }
            // MARK: - /
        }
    }
    
    private func setDim(width: Double, height: Double) {
        WindowUtils.screenHeight = height
        WindowUtils.screenWidth = width
        
        print(WindowUtils.screenHeight , WindowUtils.screenWidth)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

