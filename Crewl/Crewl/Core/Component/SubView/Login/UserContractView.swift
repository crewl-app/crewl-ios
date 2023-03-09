//
//  PrivacyPolicyView.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct UserContractView: View {
	@Binding var isCheckboxMarked : Bool
	@Binding var isPrivacyPolicyActivated : Bool
	@Binding var isTermsOfServiceActivated : Bool

	var body: some View {
		ZStack {
			VStack {
				HStack(spacing: 15) {
					DefaultCheckbox(checkMarked: $isCheckboxMarked)
						.onTapGesture {
							withAnimation(.linear(duration: ANIMATION_DELAY)) {
								isCheckboxMarked.toggle()
							}
						}
					ContractText(
						isPrivacyPolicyActivated: $isPrivacyPolicyActivated,
						isTermsOfServiceActivated: $isTermsOfServiceActivated
					)
				}
			}
			.padding(.leading)
			.frame(
				width: UIScreen.main.bounds.width * 0.8,
				height: 55,
				alignment: .leading
			)
			.font(.SpaceBold15)
			.foregroundColor(.black)
			.background(
				RoundedRectangle(cornerRadius: 5, style: .continuous)
					.stroke(.black, lineWidth: 2)
					.background(
						RoundedRectangle(cornerRadius: 5, style: .continuous)
							.fill(.white))
			)
			.zIndex(1)
			.offset(x: isCheckboxMarked ? 5 : 0, y: isCheckboxMarked ? 5 : 0)

			VStack{}
				.disabled(true)
				.frame(
					width: UIScreen.main.bounds.width * 0.8,
					height: 55
				)
				.font(.SpaceBold15)
				.foregroundColor(.black)
				.background(RoundedRectangle(cornerRadius: 5, style: .continuous).fill(.black))
				.zIndex(0)
				.offset(x: 5, y: 5)
		}
		.sheet(isPresented: $isTermsOfServiceActivated, content: {
			TermsOfServiceWindow()
		})
		.sheet(isPresented: $isPrivacyPolicyActivated, content: {
			PrivacyPolicyWindow()
		})
	}
}

struct PrivacyPolicyRectengle_Previews: PreviewProvider {
	static var previews: some View {
		UserContractView(isCheckboxMarked: .constant(false), isPrivacyPolicyActivated: .constant(false), isTermsOfServiceActivated: .constant(false))
	}
}

// MARK: - Privacy Policy Text
private struct ContractText: View {
	@Binding var isPrivacyPolicyActivated : Bool
	@Binding var isTermsOfServiceActivated : Bool

	var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 2) {
				HStack(spacing: 2) {
					Text("Kullanım Koşulları")
						.font(.Rounded12.weight(.semibold))
						.onTapGesture {
							isTermsOfServiceActivated.toggle()
						}

					Text("ve")

					Text("Gizlilik Politikası")
						.font(.Rounded12.weight(.semibold))
						.onTapGesture {
							isPrivacyPolicyActivated.toggle()
						}

					Text("'nı")
				}

				Text("okudum ve kabul ediyorum.")
			}
			.font(.Rounded12)
			.lineLimit(1)
		}
	}
}

// MARK: - Privacy Policy Checkmark rectengle
private struct DefaultCheckbox: View {
	@Binding var checkMarked : Bool

	var body: some View {
		ZStack {
			ZStack {
				RoundedRectangle(cornerRadius: 5)
					.stroke(lineWidth: 2)
					.frame(width: 20, height: 20)

				Image(systemName: "checkmark")
					.font(.system(size: 13, weight: .semibold))
					.opacity(checkMarked ? 1 : 0)
			}
		}
	}
}

// MARK: - Terms Of Use View View
private struct TermsOfServiceWindow : View {
	var body: some View {
		VStack {
			TopIndicator()
				.padding(.top, 10)
				.padding(.bottom, 20)

			ScrollView(showsIndicators: true) {
				VStack {
					Image.TermsOfService
						.resizable()
						.scaledToFit()
						.frame(width: 250)

					Text(TextHelper.TermsService.TermsOfUser.rawValue.locale())
						.padding()
						.font(.SpaceBold20)

					Text(TextHelper.TermsService.TermsOfUseDescription.rawValue.locale())
						.font(.system(size: 14, weight: .light))
						.lineSpacing(5)
						.padding(.horizontal, 30)
				}.multilineTextAlignment(.center)
					.padding()
			}
		}.background(
			Color.CrewlBackgroundColor.ignoresSafeArea()
		)
	}
}

// MARK: - Privacy Policy View
private struct PrivacyPolicyWindow : View {
	var body: some View {
		VStack {
			TopIndicator()
				.padding(.top, 10)
				.padding(.bottom, 20)

			ScrollView(showsIndicators: true) {
				VStack {
					Image.PrivacyPolicy
						.resizable()
						.scaledToFit()
						.frame(width: 250)

					Text(TextHelper.TermsService.PrivacyPolicy.rawValue.locale())
						.padding()
						.font(.SpaceBold20)

					Text(TextHelper.TermsService.PrivacyPolicyDescription.rawValue.locale())
						.font(.system(size: 14, weight: .light))
						.lineSpacing(5)
						.padding(.horizontal, 30)
				}.multilineTextAlignment(.center)
					.padding()
			}
		}
		.background(
			Color.CrewlBackgroundColor.ignoresSafeArea()
		)
	}
}

private struct TopIndicator: View {
	var body: some View {
		RoundedRectangle(cornerRadius: 4)
			.frame(width: 44, height: 4)
			.foregroundColor(Color.CrewlGray)
	}
}
