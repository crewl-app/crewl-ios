//
//  LoginSuccessView.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import SwiftUI

struct LoginSuccessView: View {
	@ObservedObject var viewModel : LoginSuccessViewModel = .init()

	var body: some View {
		ZStack {
			Color.CrewlBackgroundColor
				.ignoresSafeArea()
			VStack(alignment: .leading, spacing: 20) {
				Spacer(minLength: 50)
				// MARK: - Image
				Image.LoginSuccess
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 350)

				Group {
					Text(TextHelper.LoginText.ConfirmInLastLogin.rawValue.locale())
						.font(.SpaceBold26)

					Text(TextHelper.LoginText.NextToPageInLastLogin.rawValue.locale())
						.font(.Rounded20)
						.fontWeight(.bold)
						.frame(alignment: .leading)
				}.padding(.horizontal)

				Spacer()

				PrimaryButton(text: "Devam Et",
							  size: CGSize(width: UIScreen.main.bounds.width * 0.9, height: 55)
				) {}
					.frame(maxWidth: .infinity, alignment: .center)
					.padding(.all, 20)
				// MARK: - Button
				//                NavigationLink {
				//                    viewModel.router.goToHomeView()
				//                        .navigationBarBackButtonHidden(true)
				//                } label: {
				//                    Text(TextHelper.ButtonText.Continue.rawValue.locale())
				//                        .font(.SpaceBold13)
				//                }
				//                .buttonStyle(PrimaryButtonStyle(buttonColor: Color.CrewlYellow,
				//                                                buttonWidth: 321))
				// MARK: - \\
			}.frame(maxWidth: .infinity, alignment: .leading)
		}
	}
}

struct LoginSuccessView_Previews: PreviewProvider {
	static var previews: some View {
		LoginSuccessView()
	}
}
