//
//  RegisterLocationHeader.swift
//  Crewl
//
//  Created by NomoteteS on 6.03.2023.
//

import SwiftUI

struct RegisterLocationHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: 15) {
                Text("Şu an neredesin ?")
                    .font(.SpaceBold23)
                
                Text("Diğer kullanıcılar lokasyonunu göremez.")
            }
            
            Spacer()
            
        }
        .padding(.leading)
    }
}

struct RegisterLocationHeader_Previews: PreviewProvider {
    static var previews: some View {
        RegisterLocationHeader()
    }
}
