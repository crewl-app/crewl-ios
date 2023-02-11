//
//  BackButtonStyle.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct BackButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .zIndex(2)
                .offset(
                    x: configuration.isPressed ? 6 : 0,
                    y: configuration.isPressed ? 5 : 0
                )
        
            Image(systemName: "chevron.backward")
                .frame(width: 6, height: 13)
                .zIndex(3)
                .offset(
                    x: configuration.isPressed ? 6 : 0,
                    y: configuration.isPressed ? 5 : 0
                )
            
            CustomButton(buttonColor: Color.CrewlWhite, frameWidth: 34, frameHeight: 34)
                .offset(
                    x: configuration.isPressed ? 6 : 0,
                    y: configuration.isPressed ? 5 : 0
                )
            
            CustomBlackBackground(buttonColor: Color.CrewlBlack, frameWidth: 34, frameHeight: 34)
        }
    }
}

struct BackButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.BackgroundColor
                .ignoresSafeArea()
            VStack {
                Button {
                    
                } label: {
                    
                }.buttonStyle(BackButtonStyle())

            }
        }
    }
}
