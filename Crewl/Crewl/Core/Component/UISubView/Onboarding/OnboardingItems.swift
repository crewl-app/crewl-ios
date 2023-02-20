//
//  OnboardingItems.swift
//  Crewl
//
//  Created by NomoteteS on 16.02.2023.
//

import SwiftUI

struct OnboardingItems: View {
    
    var items : OnboardingItem
    var widthT : CGFloat
    var widthD : CGFloat
    var imageSize : CGSize
    
    var body: some View {
            VStack(spacing: 0) {
                // MARK: - Onboarding Title Text
                Text(items.title.locale())
                    .font(.SpaceBold22)
                    .lineLimit(2)
                    .frame(width:widthT)
                    .padding(.bottom,0.056.dH())
                    .padding(.top,0.045.dH())
                // MARK: - Onboarding Image
                items.image
                    .resizable()
                    .frame(width: imageSize.width,
                           height: imageSize.height)
                // MARK: - Onboarding Description Text
                Text(items.description.locale())
                    .font(.SpaceMedium14)
                    .foregroundColor(.CrewlGray)
                    .lineLimit(2)
                    .frame(width: widthD)
                    .padding(.all,0.05.dH())
        }
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
    }
}

struct TemplateOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingItems(items: OnboardingItem(title: TextHelper.Onboarding.FirstOnboardingTitle.rawValue,
                                              image: Image.OnboardingOne,
                                              description: TextHelper.Onboarding.FirstOnboardingDescription.rawValue,
                                              tag: 0),
                        widthT: 0.67.dW(),
                        widthD: 0.86.dW(),
                        imageSize: CGSize(width: 0.87.dW(),
                                          height: 0.543.dH()))
    }
}
