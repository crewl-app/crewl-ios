//
//  CountryTextField.swift
//  Crewl
//
//  Created by NomoteteS on 8.02.2023.
//

import SwiftUI

struct CountryTextField: View {
	@Binding var country: Country

	var body: some View {
		ZStack {
			HStack {
				Text(country.countryCode.isEmpty ? "🇹🇷 +90" : (country.flag) + " " + (country.countryCode))
					.font(.system(size: 15, weight: .bold))
					.padding(.horizontal, 8)
					.padding(.vertical, 10)
					.overlay(
						RoundedRectangle(cornerRadius: 5)
							.stroke(Color.CrewlWhiteGray, lineWidth: 1)
					)
					.background(Color.CrewlWhite.cornerRadius(5))
			}
		}
	}
}

struct PreviewCountryCodeTextField: PreviewProvider {
	static var previews: some View {
		ZStack {
			CountryTextField(country: .constant(Country(name: "Turkey", dialogCode: "TR", countryCode: "90", flag: "🇹🇷")))
		}
	}
}

