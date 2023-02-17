//
//  OnboardingView.swift
//  Crewl
//
//  Created by NomoteteS on 5.02.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var viewModel : OnboardingViewModel = .init()
    
    var body: some View {
        GeometryReader { Geo in
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack(spacing: 0) {
                // MARK: - Items
                TabView(selection: $viewModel.pageIndex) {
                    ForEach(viewModel.onboardingItems) { item in
                        VStack {
                            TemplateOnboarding(items: item,
                                               titleWitdh: Geo.dw(0.67),
                                               desriptionWidth: Geo.dw(0.82),
                                               imageHeight: Geo.dh(0.58),
                                               imageWidth: Geo.dw(0.9))
                        }
                        .tag(item.tag)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                // MARK: - Button
                PrimaryButton(action: {
                    withAnimation(.easeIn) {
                        if viewModel.pageIndex >= 3 {
                            viewModel.routerActive = true
                        }else {
                            viewModel.pageIndex += 1
                        }
                    }
                },
                              text: TextHelper.ButtonText.Continue.rawValue,
                              buttonWidth: Geo.dw(0.76)
                )
                .padding(.vertical)
                // MARK: - /
            }
        }
        .fullScreenCover(isPresented: $viewModel.routerActive) {
            viewModel.router.goToPrehome()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

