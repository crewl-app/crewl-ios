//
//  RegisterPhotoHeader.swift
//  Crewl
//
//  Created by NomoteteS on 6.03.2023.
//

import SwiftUI

struct RegisterPhotoHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Fotoğrafını yükle.")
                    .font(.SpaceBold25)
                Text("Lütfen yüzünün gözüktüğü bir fotoğrafını yükle.\nFotoğrafını istediğin zaman değiştirebilirsin.")
                    .font(.Rounded16)
                    .foregroundColor(Color.CrewlGray)
            }
            
            Spacer()
            
        }
        .padding(EdgeInsets.init(top: 20,
                                 leading: 20,
                                 bottom: 0,
                                 trailing: 0))
    }
}

struct RegisterPhotoHeader_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPhotoHeader()
    }
}
