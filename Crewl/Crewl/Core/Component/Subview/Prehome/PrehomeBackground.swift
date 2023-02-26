//
//  PrehomeBackground.swift
//  Crewl
//
//  Created by NomoteteS on 18.02.2023.
//

import SwiftUI

struct PrehomeBackground: View {
	var body: some View {
		VStack {
			PreHomeBackgroundImage()
		}
	}
}

struct PrehomeBackground_Previews: PreviewProvider {
	static var previews: some View {
		PrehomeBackground().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
			.previewDisplayName("iPhone 14")

		PrehomeBackground().previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
			.previewDisplayName("iPhone 13")

		PrehomeBackground().previewDevice("iPhone SE (2nd generation)")
			.previewDisplayName("iPhone SE")
	}
}

private struct PreHomeBackgroundImage : View {
	var body: some View {
		if (UIScreen.main.bounds.height < 680) {
			Image.PreHomeBackgroundSE
				.resizable()
				.aspectRatio(contentMode: .fill)
				.edgesIgnoringSafeArea(.bottom)
		} else {
			Image.PreHomeBackgroundMax
				.resizable()
				.aspectRatio(contentMode: .fill)
				.edgesIgnoringSafeArea(.bottom)
		}
	}
}
