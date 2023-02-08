//
//  ContentView.swift
//  Shigo
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("SplashScreen")
                 .resizable()
                 .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
