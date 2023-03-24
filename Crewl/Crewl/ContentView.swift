//
//  ContentView.swift
//  
//
//  Created by NomoteteS on 21.03.2023.
//

import SwiftUI

struct ContentView: View {
    let genderOptions = ["A", "B"]
    @State var selectedGender: String?

    var body: some View {
        VStack {
            Text("A mı B mi")
                .font(.title)
                .padding()
            
            ForEach(genderOptions, id: \.self) { option in
                HStack {
                    Text(option)
                        .font(.headline)
                    Spacer()
                }
                .padding()
                .background(selectedGender == option ? Color.blue : Color.white)
                .cornerRadius(10)
                .onTapGesture {
                    selectedGender = option
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
