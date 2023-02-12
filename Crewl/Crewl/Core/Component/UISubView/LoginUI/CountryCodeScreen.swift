//
//  CountryCodeBottomSheet.swift
//  Crewl
//
//  Created by Kaan on 12.02.2023.
//

import SwiftUI

struct CountryCodeScreen : View{
    @Binding var countries: [Country]
    @Binding var isClickedCountry : Bool
    
    var onCountryItemClicked: (Country) -> Void
    
    @State var searchQuery = ""
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 44,height: 4)
                        .foregroundColor(Color.gray)
                        .padding()
                    
                    // MARK: - Searchbar
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.CrewlGray)
                            .frame(height: 40)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Searching", text: $searchQuery)
                        }
                        .padding(.leading)
                    }.padding()
                    
                    ForEach(searchQuery == "" ? countries : countries.filter{
                        $0.name.lowercased().contains(searchQuery.lowercased())
                    }) { country in
                        CountryItem(country: country) { selectedCountry in
                            onCountryItemClicked(selectedCountry)
                        }.padding(5)
                    }
                }.padding(.horizontal)
            }
        }.background(Color.BackgroundColor)
    }
}

