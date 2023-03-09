//
//  RegisterBirthHeader.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct RegisterBirthHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: 20) {
                Text("Ne zaman doğdun?")
                    .font(.SpaceBold23)
                
                Text("Diğer kullanıcılar sadece yaşını görebilir.")
                    .font(.Rounded14)
                    .foregroundColor(.CrewlGray)
            }
            Spacer()
        }
        .padding(EdgeInsets.init(top: 20,
                                 leading: 20,
                                 bottom: 0,
                                 trailing: 0))
    }
}

struct RegisteBirthHeader_Previews: PreviewProvider {
    static var previews: some View {
        RegisterBirthHeader()
    }
}
