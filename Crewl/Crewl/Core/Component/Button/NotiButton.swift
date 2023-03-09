//
//  NotiButton.swift
//  Crewl
//
//  Created by NomoteteS on 7.03.2023.
//

import SwiftUI

struct NotiButton: View {
    
    @State var isColorChange: Bool
    @State var isChange = false
    @State var text: String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
            isChange.toggle()
            
            if isChange {
                withAnimation {
                    isChange.toggle()
                }
            }
            
        } label: {
            Text(text)
        }
        .buttonStyle(LaterButtonStyle(isChange: $isChange,
                                      isColorChange: $isColorChange))
    }
}

struct NotiButton_Previews: PreviewProvider {
    static var previews: some View {
        NotiButton(isColorChange: false,
                   isChange: false,
                   text: "NotiButton"){
            
        }
    }
}


private struct LaterButtonStyle: ButtonStyle {
    
    @Binding var isChange: Bool
    @Binding var isColorChange: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .offset(x: isChange ? 3 : 0,
                    y: isChange ? 3 : 0)
            .font(.SpaceBold13)
            .background{
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .offset(x:3,
                                y:3)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .background {
                            if isColorChange {
                                Color.CrewlWhite
                                    .cornerRadius(10)
                            } else {
                                Color.CrewlYellow
                                    .cornerRadius(10)
                            }
                        }
                        .offset(x: isChange ? 3 : 0,
                                y: isChange ? 3 : 0)
                }
                .padding(EdgeInsets.init(top: -20,
                                         leading: -30,
                                         bottom: -20,
                                         trailing: -30))
            }
    }
}
