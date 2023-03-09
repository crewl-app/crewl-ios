//
//  CountryItem.swift
//  Crewl
//
//  Created by Kaan on 12.02.2023.
//

import SwiftUI

struct CountryItem: View {
    var country: Country
    
    var onCountryItemClicked: (Country) -> Void
    
    var body: some View {
        HStack(spacing: 20) {
            Text(country.flag)
                .font(.system(size: 20))
                .padding(.leading)
            
            Text(country.name)
                .font(.system(size: 17, weight: .semibold))
            
            Spacer() // Spacer
            
            Text(country.countryCode)
                .font(.system(size: 15, weight: .semibold)).padding(.trailing)
        }.frame(maxWidth: .infinity)
            .onTapGesture {
                onCountryItemClicked(country)
            }
        
        Rectangle()
            .frame(height: 1)
            .foregroundColor(Color.CrewlWhiteGray)
            .padding(.horizontal)
    }
}
