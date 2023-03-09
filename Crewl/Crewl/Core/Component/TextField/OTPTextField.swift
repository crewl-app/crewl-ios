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
		.padding(.horizontal)
    }

    @ViewBuilder
    func OTPTextBox(_ index: Int) -> some View {
		ZStack {
		}
		.frame(width: 45, height: 45)
		.background {
			RoundedRectangle(cornerRadius: 5)
				.offset(x: 5, y: 5)

			// Set Box
			let status = ((isKeyboardShowing && otpText.count > index) || otpText.count > index)
			RoundedRectangle(cornerRadius: 5, style: .continuous)
				.stroke( wrongCode ? Color(.red) : Color(ColorHelper.black.rawValue), lineWidth: 2 )
				.background {
					Color(ColorHelper.white.rawValue)
						.cornerRadius(5)
					if otpText.count > index {
						Text(String(otpText[otpText.index(otpText.startIndex, offsetBy: index)]))
							.font(.SpaceBold17)
							.frame(alignment: .center)
					}else {
						Text("")
					}
				}
				.offset(x: status ? 5 : 0, y: status ? 5 : 0)
				.animation(Animation.easeInOut(duration: 0.2), value: status)
		}
		.frame(maxWidth: .infinity)
		.padding(.all, 3)
    }
}

struct CustomOTPTextField_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			Color.CrewlBackgroundColor
				.ignoresSafeArea()
			VStack {
				OTPTextField(otpText: .constant(""), wrongCode: .constant(false))
			}.padding(.all)
		}
	}
}
