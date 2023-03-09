//
//  PhoneTextField.swift
//  Crewl
//
//  Created by NomoteteS on 8.02.2023.
//

import SwiftUI

struct PhoneTextField: View {

	@Binding var number : String
	@State var tab = false
	@State var isTapped = false

	var body: some View {
		VStack {
			VStack(alignment: .leading, spacing: 4) {
				HStack(spacing: 15) {
					TextField("", text: $number.limit(10)) { (status) in
						if status {
							withAnimation(.easeIn(duration: TEXTFIELD_DELAY)) {
								isTapped = true
							}
						}
					} onCommit: {
						if number == "" {
							withAnimation(.easeOut(duration: TEXTFIELD_DELAY)) {
								isTapped = false
							}
						}
					}
					.font(.system(size: 17, weight: .semibold))
					.keyboardType(.numberPad)
				}
				.background(
					/* Placeholder. */
					Text("Telefon Numarası")
						.opacity(isTapped ? 0 : 1)
						.foregroundColor(.gray),
					alignment: .leading
				)
				.padding(.horizontal)

				Rectangle()
					.fill(isTapped ? Color.CrewlYellow : Color.CrewlWhiteGray)
					.opacity(isTapped ? 1 : 0.5)
					.frame(height: 2)
					.padding(.top, 10)
			}
			.padding(.top, 15)
			.background(.white)
			.cornerRadius(5)

			HStack {
				Text("* ").foregroundColor(Color.red).font(.system(size: 15)) +
				Text(TextHelper.LoginText.AttentionMassage.rawValue.locale())
					.font(.Rounded13)
					.foregroundColor(Color.CrewlGray)
			}
			.minimumScaleFactor(0.8)
			.padding(.top, 5)
		}
	}
}

struct CustomPhoneTextField_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			Color.CrewlBackgroundColor
				.ignoresSafeArea()
			PhoneTextField(number: .constant("")).padding(.all, 40)
		}
	}
}
