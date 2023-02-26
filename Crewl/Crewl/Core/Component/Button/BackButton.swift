//
//  BackButton.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct BackButton: View {
	@Environment(\.dismiss) var dismiss
	var color : Color?
	var action : () -> Void = {}

	@State private var isAnimated = false

	var body: some View {
		ZStack {
			Button(action: {}) {
				HStack {
					Image(systemName: "chevron.backward")
				}
			}
			.padding()
			.frame(width: 35, height: 35)
			.foregroundColor(.black)
			.background(background)
			.zIndex(1)
			.offset(x: isAnimated ? 4 : 0, y: isAnimated ? 4 : 0)
			.disabled(true)
			.onTapGesture {
				withAnimation(.linear(duration: ANIMATION_DELAY)) {
					isAnimated.toggle()
				}

				DispatchQueue.main.asyncAfter(deadline: .now() + ANIMATION_DELAY) {
					withAnimation(.linear(duration: ANIMATION_DELAY)) {
						isAnimated.toggle()
						dismiss()
					}
				}

				action()
			}

			Button(action: {}) {}
				.padding()
				.frame(width: 35, height: 35)
				.disabled(true)
				.font(.SpaceBold15)
				.foregroundColor(.black)
				.background(RoundedRectangle(cornerRadius: 8, style: .continuous).fill(.black))
				.zIndex(0)
				.offset(x: 4, y: 4)
		}
	}

	private var background: some View {
		let rectangle = RoundedRectangle(cornerRadius: 8, style: .continuous)

		return rectangle
			.stroke(.black, lineWidth: 2)
			.background(rectangle.fill(.white))
	}
}

struct BackButton_Previews: PreviewProvider {
	static var previews: some View {
		BackButton (action: {})
	}
}
