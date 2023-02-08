//
//  CustomCountryTextField.swift
//  Crewl
//
//  Created by NomoteteS on 8.02.2023.
//

import SwiftUI

struct CustomCountryTextField: View {
    var body: some View {
        ZStack {
            countryBackground()
            TextField("", text: .constant(""))
                .frame(width: 49, height: 22)
                .disabled(true)
        }
        .frame(width: 61,
               height: 40)
    }
}

struct CustomCountryTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomCountryTextField()
    }
}

struct countryBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .stroke(Color.CrewlWhiteGray, lineWidth: 1)
            .background(Color.CrewlWhite)
        
        Text("🇹🇷 +90")
            .font(.SpaceBold13)
            
    }
}
