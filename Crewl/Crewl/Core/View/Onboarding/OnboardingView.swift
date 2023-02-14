//
//  OnboardingView.swift
//  Crewl
//
//  Created by NomoteteS on 5.02.2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var viewModel : OnboardingViewModel
    
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            
            // MARK: - Into
            VStack {
                TabView(selection: $viewModel.pageIndex) {
                    ForEach(viewModel.onboardingItems) { item in
                        VStack {
                            TemplateOnboarding(items: item)
                        }
                        .tag(item.tag)
                    }
                    .multilineTextAlignment(.center)
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
                }, text: TextHelper.ButtonText.Continue.rawValue
                    )
                
                
                Spacer()
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $viewModel.routerActive) {
            viewModel.router.goToPrehome()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: .init(routerActive: false))
    }
}

private struct TemplateOnboarding: View {
    
    var items : OnboardingItem
    
    var body: some View {
        VStack {
            Text(items.title.locale())
                .font(.SpaceBold22)
                .lineLimit(2)
                .frame(width: UIScreen.main.bounds.width * 0.79)
            
            items.image
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.9,
                       height: UIScreen.main.bounds.height * 0.56,
                       alignment: .center)
                .padding()
            
            Text(items.description.locale())
                .font(.SpaceMedium14)
                .frame(width: UIScreen.main.bounds.width * 0.79)
        }
    }
}
