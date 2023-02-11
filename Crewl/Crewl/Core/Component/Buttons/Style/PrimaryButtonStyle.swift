//
//  PrimaryButtonStyle.swift
//  Crewl
//
//  Created by NomoteteS on 6.02.2023.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    var buttonColor : Color
    var backButtonColor : Color
    var setWidthAgain : CGFloat
    var opacity : Double?
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .zIndex(2)
                .offset(
                    x: configuration.isPressed ? 6 : 0,
                    y: configuration.isPressed ? 5 : 0
                )
            
            CustomButton(buttonColor: buttonColor, frameWidth: setWidthAgain, frameHeight: 50)
                .offset(
                    x: configuration.isPressed ? 6 : 0,
                    y: configuration.isPressed ? 5 : 0
                )
            
            CustomBlackBackground(buttonColor: backButtonColor, frameWidth: setWidthAgain, frameHeight: 50)
                .opacity(opacity ?? 1)
        }
    }
}

// MARK: - Button Test
struct Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {
                
            } label: {
                Text("I am Test Wohooo")
            }.buttonStyle(PrimaryButtonStyle(buttonColor: Color.CrewlYellow, backButtonColor: Color.CrewlBlack, setWidthAgain: 300))

        }
    }
}
