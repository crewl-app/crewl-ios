//
//  PrimaryButton.swift
//  Crewl
//
//  Created by NomoteteS on 12.02.2023.
//

import SwiftUI

struct PrimaryButton: View {
	private let text : String
	private let color : Color?
	private let size : CGSize?
	@Binding private var isLoading: Bool
	private let action : () -> Void

	@State private var isAnimated = false

	init(
		text: String,
		color: Color = Color.CrewlYellow,
		isLoading: Binding<Bool> = .constant(false),
		size: CGSize = CGSize(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.width * 0.14),
		action: @escaping () -> Void
	) {
		self.text = text
		self.color = color
		self.action = action
		self.size = size
		self._isLoading = isLoading
	}

	var body: some View {
		ZStack {
			VStack {
				Text(text)
					.opacity(isLoading ? 0 : 1)
			}
			.disabled(isLoading ? true : false)
			.frame(width: size?.width,height: size?.height)
			.font(.SpaceBold15)
			.foregroundColor(.black)
			.background(
				RoundedRectangle(cornerRadius: 8, style: .continuous)
					.stroke(.black, lineWidth: 2)
					.background(
						RoundedRectangle(cornerRadius: 8, style: .continuous)
							.fill(color ?? Color.CrewlYellow))
			)
			.zIndex(1)
			.offset(x: isAnimated ? 5 : 0, y: isAnimated ? 5 : 0)
			.onTapGesture {
				if !isLoading {
					withAnimation(.linear(duration: ANIMATION_DELAY)) {
						isAnimated.toggle()
					}

					DispatchQueue.main.asyncAfter(deadline: .now() + ANIMATION_DELAY) {
						withAnimation(.linear(duration: ANIMATION_DELAY)) {
							isAnimated.toggle()
							action()
						}
					}
				}
			}

			ProgressView()
				.zIndex(1)
				.opacity(isLoading ? 1 : 0)
				.tint(.black)
				.scaleEffect(1, anchor: .center)

			VStack {}
				.disabled(true)
				.frame(
					width: size?.width ?? UIScreen.main.bounds.width * 0.7,
					height: size?.height ?? UIScreen.main.bounds.width * 0.14
				)
				.font(.SpaceBold15)
				.foregroundColor(.black)
				.background(RoundedRectangle(cornerRadius: 8, style: .continuous).fill(.black))
				.zIndex(0)
				.offset(x: 5, y: 5)
		}
	}
}

struct PrimaryButton_Previews: PreviewProvider {
	static var previews: some View {
		PrimaryButton(text: "Primary Button", color: Color.CrewlYellow) {}
	}
}
