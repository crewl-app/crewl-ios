//
//  Prehome.swift
//  Crewl
//
//  Created by NomoteteS on 6.02.2023.
//

import SwiftUI

struct PrehomeView: View {
    @ObservedObject var viewModel : PrehomeViewModel = .init()
    @State var isClickedForRegister = false
    
    var body: some View {
        ZStack {
            //MARK: - Prehome Background Image
            PrehomeBackground()
            //MARK: - Prehome Continue Button
            ZStack {
				PrimaryButton(
					text: "Devam Et",
					color: .white,
					size: CGSize(width: UIScreen.main.bounds.width * 0.45, height: 55)
				) {
					isClickedForRegister = true
				}
				
				.frame(maxHeight: UIScreen.main.bounds.height * 0.56, alignment: .bottom)

				NavigationLink(isActive: $isClickedForRegister) {
						viewModel.router.navigateLogin()
							.navigationBarHidden(true)
				} label: {}
                //MARK: - /
            }
		}.background(
			Color.CrewlBackgroundColor.ignoresSafeArea()
		)
    }
}


struct PrehomeView_Previews: PreviewProvider {
    static var previews: some View {
        PrehomeView()
    }
}



