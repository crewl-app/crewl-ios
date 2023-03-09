//
//  NotiLocationView.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct NotiLocationView: View {
    
    @StateObject var viewModel: NotiLocationViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                
                Spacer()

                //MARK: NotiLocationView - Image
                Image.Location
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal,120)
                    .padding(.bottom,33)
                                
                //MARK: NotiLocationView - Tittle & Description
                VStack(spacing:10) {
                    Text("Konum servislerini aç")
                        .font(.SpaceBold20)
                    
                    Text("Etrafındaki etkinlikleri sana göstermemiz için \nlokasyon izni vermen gerekiyor. Gerekmiyor mu?")
                        .font(.Rounded15)
                }
                .padding(.vertical)
                .padding(.bottom,33)
                .multilineTextAlignment(.center)
                
                //MARK: NotiLocationView - Buttons
                ZStack{
                    NavigationLink(isActive: $viewModel.isSkipView) {
                        viewModel.router.navigate()
                    } label: {  }

                    
                    NotiButtonCollected {
                        viewModel.isSkipView.toggle()
                    } allowAction: {
                        viewModel.isSkipView.toggle()
                        LocationService.shared.requestLocation()
                    }
                }
                .padding(.top)
                
                Spacer()

            }
        }
    }
}

struct NotiLocationView_Previews: PreviewProvider {
    static var previews: some View {
        NotiLocationView()
    }
}
