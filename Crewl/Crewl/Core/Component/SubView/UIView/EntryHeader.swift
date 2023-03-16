//
//  EntryHeader.swift
//  Crewl
//
//  Created by NomoteteS on 6.03.2023.
//

import SwiftUI

struct EntryHeader: View {
    
    var title: String
    var description: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: 15) {
                Text(title)
                    .font(.SpaceBold25)
                
                Text(description)
                    .font(.Rounded15)
                    .foregroundColor(.CrewlGray)
            }
            
            Spacer()
            
        }
        .padding(.leading)
    }
}

struct EntranceHeader_Previews: PreviewProvider {
    static var previews: some View {
        EntryHeader(title: "", description: "")
    }
}
