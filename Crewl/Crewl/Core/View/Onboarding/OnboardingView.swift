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
			VStack {
				// MARK: - Onboarding ForEach Item
				TabView(selection: $viewModel.pageIndex) {
					ForEach(viewModel.onboardingItems) { item in
						VStack {
							OnboardingItemContent(item: item)
						}
						.tag(item.tag)
					}
				}
				.tabViewStyle(.page(indexDisplayMode: .never))
				.indexViewStyle(.page(backgroundDisplayMode: .always))

				// MARK: - Onboarding Button
				PrimaryButton(text: "Devam Et") {
					withAnimation(.easeIn) {
						if viewModel.pageIndex >= 3 {
							viewModel.routerActive = true
						} else {
							viewModel.pageIndex += 1
						}
					}
				}
				.padding(.bottom, 20)
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
		OnboardingView().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
			.previewDisplayName("iPhone 14")
	}
}
