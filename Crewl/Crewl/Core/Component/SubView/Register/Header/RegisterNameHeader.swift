//
//  RegisterNameViewHeader.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct RegisterNameViewHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: 20) {
                Text("İsmin nedir?")
                    .font(.SpaceBold23)
                Text("Diğer Kullanıcılar sadece ismini görebilir.")
                    .foregroundColor(.CrewlGray)
                    .font(.Rounded15)
            }
            Spacer()
        }
        .padding(.leading,30)
    }
}


struct RegisterHeader_Previews: PreviewProvider {
    static var previews: some View {
        RegisterNameViewHeader()
    }
}
