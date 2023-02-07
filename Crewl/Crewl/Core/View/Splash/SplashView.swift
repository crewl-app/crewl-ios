//
//  SplashView.swift
//  Crewl
//
//  Created by NomoteteS on 4.02.2023.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var ViewModel : SplashViewModel 
    
    var body: some View {
        if ViewModel.isActive {
            ViewModel.router.goToOnboarding()
        } else {
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .ignoresSafeArea()
                    .foregroundColor(Color.CrewlYellow)
                Image.AppLogo
                    .resizable()
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.5 / 3,
                           maxHeight: UIScreen.main.bounds.height * 0.5 / 3.6)
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(ViewModel: .init(isActive: false, router: SplashRoutePromoter()))
    }
}

