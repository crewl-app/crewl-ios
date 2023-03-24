//
//  RegisterSuccessView.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct RegisterSuccessView: View {
    
    @ObservedObject var viewModel: RegisterSuccessViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                //MARK: RegisterSuccessView - Header
                //TODO: Check Image size
                VStack(alignment: .leading) {
                    Image("registerSuccess")
                        .resizable()
                        .fixedSize()
                        .padding(.trailing)
                    
                    VStack(alignment: .leading) {
                        Text("Çok iyi! \nŞimdi profilini oluşturabiliriz.")
                            .font(.SpaceBold23)
                        Text("Devam edelim mi?")
                            .font(.SpaceBold18)
                    }
                    .padding(.leading)
                }
                //MARK: RegisterSuccessView - Button
                ZStack {
                    NavigationLink(isActive: .constant(false)) {
                        viewModel.router.navigateHome()
                    } label: {  }
                    PrimaryButton(text: "Devam Et") {
                        UserDataManager.shared.regsiter(userName: viewModel.userName,
                                                        userSurname: viewModel.userSurname,
                                                        userPhone: viewModel.userPhoneNumber,
                                                        latitude: viewModel.userLatitude,
                                                        longitude: viewModel.userLongitude,
                                                        userImage: viewModel.userImage,
                                                        userBirthdate: viewModel.userBirthDate,
                                                        userGender: viewModel.userGender)
                    }
                }
            }
        }
    }
}

struct RegisterSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterSuccessView(viewModel: .init(userName: "",
                                             userSurname: "",
                                             userPhoneNumber: "",
                                             userBirthDate: "",
                                             userGender: "",
                                             userImage: UIImage(named: "") ?? UIImage(named: "")!))
    }
}
