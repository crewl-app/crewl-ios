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
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack(spacing: 0) {
                // MARK: - Onboarding ForEach Item
                TabView(selection: $viewModel.pageIndex) {
                    ForEach(viewModel.onboardingItems) { item in
                        VStack {
                            OnboardingItems(items: item,
                                            widthT: 0.61.dW(),
                                            widthD: 0.82.dW(),
                                            imageSize: CGSize(width: 0.87.dW(),
                                                              height: 0.543.dH()))
                        }
                        .tag(item.tag)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                // MARK: - Onboarding Button
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
                              buttonWidth: 0.76.dW()
                )
                .padding(.vertical)
                // MARK: - /
            }
        }
        .fullScreenCover(isPresented: $viewModel.routerActive) {
            NavigationView {
                viewModel.router.goToPrehome()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

