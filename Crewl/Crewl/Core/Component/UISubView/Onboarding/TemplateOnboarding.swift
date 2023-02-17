//
//  TemplateOnboarding.swift
//  Crewl
//
//  Created by NomoteteS on 16.02.2023.
//

import SwiftUI

struct TemplateOnboarding: View {
    
    var items : OnboardingItem
    var titleWitdh : CGFloat
    var desriptionWidth : CGFloat
    var imageHeight : CGFloat
    var imageWidth : CGFloat
    
    var body: some View {
            VStack(alignment: .center, spacing: 0) {
                Text(items.title.locale())
                    .font(.SpaceBold23)
                    .lineLimit(2)
                    .frame(width:titleWitdh)
                    .padding(.vertical)

                items.image
                    .resizable()
                    .frame(width: imageWidth,
                           height: imageHeight)
                    .padding(.vertical)
                
                Text(items.description.locale())
                    .font(.SpaceMedium14)
                    .foregroundColor(.CrewlGray)
                    .lineLimit(2)
                    .frame(width: desriptionWidth)
                    .padding(.vertical)
        }
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
    }
}

struct TemplateOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        TemplateOnboarding(items: OnboardingItem(title: TextHelper.Onboarding.FirstOnboardingTitle.rawValue,
                                                 image: Image.OnboardingOne,
                                                 description: TextHelper.Onboarding.FirstOnboardingDescription.rawValue,
                                                 tag: 0),
                           titleWitdh: CGFloat(),
                           desriptionWidth: CGFloat(),
                           imageHeight: CGFloat(),
                           imageWidth: CGFloat())
    }
}
