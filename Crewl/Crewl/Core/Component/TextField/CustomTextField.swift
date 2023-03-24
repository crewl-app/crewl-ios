//
//  CustomTextField.swift
//  Crewl
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct CustomTextField: View {
    
    var text: String
    @Binding var isTrue: Bool
    @Binding var isActive: Bool
    @Binding var textField: String
    @State var image: String?
    
    var body: some View {
        HStack(spacing:0) {
            
            if image?.count ?? "".count > 0 {
                Image(systemName: image ?? "")
                    .padding(.leading)
                
                TextField(text, text: $textField)
                    .padding(.horizontal)
            } else {
                TextField(text, text: $textField)
                    .padding(.leading)
            }
            
            Spacer()
        }
        .background{
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(.CrewlWhite)
                Rectangle()
                    .frame(height: 2)
                    .offset(y: 30)
                    .foregroundColor(.CrewlWhiteGray)
                // if is wrong
                Rectangle()
                    .frame(height: 2)
                    .offset(y: 30)
                    .foregroundColor(isTrue ? .CrewlYellow : .red)
                    .opacity(isActive ? 1 : 0)
            }
            .frame(height: 60)
        }
        .frame(height: 60)
        .padding(.horizontal)
        
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            CustomTextField(text: "asdasdas",
                            isTrue: .constant(false),
                            isActive: .constant(true),
                            textField: .constant(""),
                            image: "")
        }
    }
}
