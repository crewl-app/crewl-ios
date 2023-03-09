//
//  OTPHeaderContent.swift
//  Crewl
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct OTPHeaderContent: View {
    var number: String

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(TextHelper.LoginText.VerificationText.rawValue.locale())
                .font(.SpaceBold23)

            Group {
                Text(number).font(.system(size: 16, weight: .bold)) +
                Text(TextHelper.LoginText.SendedCodeNumber.rawValue.locale())
                    .font(.Rounded16)
                    .foregroundColor(Color.CrewlGray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct OTPHeaderContent_Previews: PreviewProvider {
    static var previews: some View {
        OTPHeaderContent(number: "")
    }
}
