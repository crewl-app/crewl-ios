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
            viewModel.router.navigate()
        } else {
            // MARK: - Splash showing
                ZStack{
                    Color.CrewlYellow
                        .ignoresSafeArea()
                    
                }.edgesIgnoringSafeArea(.all)
				.background {
					GeometryReader { geo in
						VStack {
							Text("")
						}.onChange(of: geo.size) { newSize in
							viewModel.setPhoneDimensions(size: newSize)
						   }
					}
				}
		}
	}
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

