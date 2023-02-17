//
//  PrimaryButton.swift
//  Crewl
//
//  Created by NomoteteS on 12.02.2023.
//

import SwiftUI

struct PrimaryButton: View {
    
    var action : () -> Void
    var text : String
    var buttonWidth : CGFloat
    var buttonHeight : CGFloat?
    var buttonColor : Color?
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text.locale())
                .font(.SpaceBold13)
        }.buttonStyle(PrimaryButtonStyle(buttonColor: buttonColor ?? Color.CrewlYellow,
                                         buttonWidth: buttonWidth,
                                         buttonHeight: buttonHeight ?? 50 ))
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(action: {

        }, text: "Mert Türedü", buttonWidth: 0, buttonHeight: 0)

    }
}
