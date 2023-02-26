//
//  OnboardingItems.swift
//  Crewl
//
//  Created by NomoteteS on 16.02.2023.
//

import SwiftUI

struct OnboardingItemContent: View {
	var item : OnboardingItem

	var body: some View {
		VStack(spacing: 40) {
			// MARK: - Onboarding Title Text
			Text(item.title.locale())
				.font(.SpaceBold25)
				.minimumScaleFactor(0.5)
				.lineLimit(2)

			// MARK: - Onboarding Image
			item.image
				.resizable()
				.aspectRatio(contentMode: .fit)


			// MARK: - Onboarding Description Text
			Text(item.description.locale())
				.font(.Rounded16)
				.minimumScaleFactor(0.5)
				.foregroundColor(.CrewlGray)
				.lineLimit(2)
				.lineSpacing(5)
		}
		.padding(.all)
		.padding(.vertical)
		.aspectRatio(contentMode: .fit)
		.multilineTextAlignment(.center)
	}

}

struct TemplateOnboarding_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingItemContent(
			item: OnboardingItem(title: TextHelper.Onboarding.FirstOnboardingTitle.rawValue,
								 image: Image.OnboardingOne,
								 description: TextHelper.Onboarding.FirstOnboardingDescription.rawValue,
								 tag: 0)).previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
			.previewDisplayName("iPhone 14 Pro Max")

		OnboardingItemContent(
			item: OnboardingItem(title: TextHelper.Onboarding.FirstOnboardingTitle.rawValue,
								 image: Image.OnboardingOne,
								 description: TextHelper.Onboarding.FirstOnboardingDescription.rawValue,
								 tag: 0)).previewDevice("iPhone SE (2nd generation)")
			.previewDisplayName("iPhone SE")

		OnboardingItemContent(
			item: OnboardingItem(title: TextHelper.Onboarding.FirstOnboardingTitle.rawValue,
								 image: Image.OnboardingOne,
								 description: TextHelper.Onboarding.FirstOnboardingDescription.rawValue,
								 tag: 0)).previewDevice("iPhone SE (1st generation)")
			.previewDisplayName("iPhone SE 1")
	}
}
