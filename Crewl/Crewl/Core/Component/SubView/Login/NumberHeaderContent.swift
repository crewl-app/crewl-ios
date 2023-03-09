//
//  NumberHeaderContent.swift
//  Crewl
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct NumberHeaderContent: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(TextHelper.LoginText.LoginTitle.rawValue.locale())
                .font(.SpaceBold25)

            Text(TextHelper.LoginText.LoginDescription.rawValue.locale())
                .font(.Rounded16)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
                .lineSpacing(5)
                .foregroundColor(Color.CrewlGray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical)
        .fixedSize(horizontal: false, vertical: true)
    }
}
