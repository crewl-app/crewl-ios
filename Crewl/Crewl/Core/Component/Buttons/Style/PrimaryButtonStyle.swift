//
//  PrimaryButtonStyle.swift
//  Crewl
//
//  Created by NomoteteS on 6.02.2023.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    var buttonColor : Color
    var buttonWidth : CGFloat
    var buttonHeight : CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            // MARK: - Primary Button
            configuration.label
                .zIndex(2)
                .offset(
                    x: configuration.isPressed ? 6 : 0,
                    y: configuration.isPressed ? 5 : 0
                )
            
            CustomButton(buttonColor: buttonColor, frameWidth: buttonWidth, frameHeight: buttonHeight)
                .offset(
                    x: configuration.isPressed ? 6 : 0,
                    y: configuration.isPressed ? 5 : 0
                )
            
            CustomBlackBackground(buttonColor: Color.CrewlBlack, frameWidth: buttonWidth, frameHeight: buttonHeight)
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
            }.buttonStyle(PrimaryButtonStyle(buttonColor: Color.CrewlYellow, buttonWidth: 300, buttonHeight: 50))
        }
    }
}
// MARK: - /
