//
//  NotiNotificationView.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct NotiNotificationView: View {
    
    @ObservedObject var viewModel: NotiNotificationViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                //MARK: NotiNotificationView - Image
                Image.Notification
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal,50)
                    .padding(.bottom,33)
                //MARK: NotiNotificationView - Text & Description
                VStack(spacing:10) {
                    Text("Bildirimlerini aç")
                        .font(.SpaceBold20)
                    
                    Text("Sana haber yollamamız için bildirim izni ver. Yoksa \nolan bitenden nasıl haberdar olacaksın?")
                        .font(.Rounded15)
                }
                .padding(.vertical)
                .padding(.bottom,33)
                .multilineTextAlignment(.center)
                //MARK: NotiNotificationView - Buttons
                ZStack {
                    NavigationLink(isActive: $viewModel.isSkipPage) {
                        viewModel.router.navigate()
                    } label: {}

                    NotiButtonCollected {
                        viewModel.isSkipPage.toggle()
                    } allowAction: {
                        viewModel.isSkipPage.toggle()
                        viewModel.getNoti()
                    }
                }
                .padding(.top)
            }
        }
    }
}

struct NotiNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotiNotificationView()
    }
}
