//
//  SecondryButton.swift
//  Crewl
//
//  Created by NomoteteS on 6.03.2023.
//

import SwiftUI

struct SecondryButton: View {
    
    var text : String
    @State var isClicked = false
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
            isClicked.toggle()
            if isClicked {
                withAnimation {
                    isClicked.toggle()
                }
            }
        } label: {
            Text(text)
        }
        .buttonStyle(SecondryButtonStyle(isClicked: $isClicked))
    }
}

struct SecondryButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SecondryButton(text: "SecondryButton") {
                
            }
        }
    }
}

struct SecondryButtonStyle: ButtonStyle {
    
    @Binding var isClicked: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .offset(x: isClicked ? 3 : 0,
                    y: isClicked ? 3 : 0)
            .font(.SpaceBold10)
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .padding(.all,-13)
                    .offset(x: 3,
                            y: 3)
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.CrewlBlack,lineWidth: 2)
                        .padding(.all,-13)
                        .background{
                            Color.CrewlWhite
                                .cornerRadius(4)
                                .padding(.all,-13)
                        }
                }
                .offset(x: isClicked ? 3 : 0,
                        y: isClicked ? 3 : 0)
            }
    }
}
