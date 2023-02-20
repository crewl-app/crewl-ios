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
                        .frame(width: Geo.size.width * 0.18 ,
                               height: Geo.size.height * 0.16)
                }
                .onChange(of: Geo.size) { newSize in
                    viewModel.setPhoneDimensions(size: newSize)
                }
            }
            // MARK: - /
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

