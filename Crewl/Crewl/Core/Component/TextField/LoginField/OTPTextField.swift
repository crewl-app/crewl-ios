//
//  OTPTextField.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import SwiftUI

struct OTPTextField: View {
    
    @Binding var otpText : String
    @Binding var wrongCode : Bool
    @FocusState private var isKeyboardShowing : Bool
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<6, id:\.self) { index in
                    OTPTextBox(index)
                }
            }
            .padding(.horizontal)
        }
        .background{
            TextField("", text: $otpText.limit(6))
                .frame(width: 1, height: 1)
                .keyboardType(.decimalPad)
                .textContentType(.oneTimeCode)
                .opacity(0.001)
                .blendMode(.screen)
                .focused($isKeyboardShowing)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isKeyboardShowing.toggle()
        }
    }
    
    @ViewBuilder
    func OTPTextBox(_ index: Int) -> some View {
        ZStack {
            if otpText.count > index {
                /// - Fİnding Char At index
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
                    .offset(x: 5, y: 5)
            }else {
                Text("")
            }
        }
        .frame(width: 38, height: 38)
        .background {
            RoundedRectangle(cornerRadius: 5)
                .offset(x: 5,
                        y: 5)
            
            // Set Box
            let status = ((isKeyboardShowing && otpText.count > index) || otpText.count > index )
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke( wrongCode ? Color(.red) : Color(ColorHelper.black.rawValue), lineWidth: 2 )
                .background {
                    Color(ColorHelper.white.rawValue)
                        .cornerRadius(5)
                }
                .offset(x: status ? 5 : 0,
                        y: status ? 5 : 0)
        }
        .frame(maxWidth: .infinity )
    }
}


struct CustomOTPTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                OTPTextField(otpText: .constant(""), wrongCode: .constant(false))
            }
        }
    }
}
