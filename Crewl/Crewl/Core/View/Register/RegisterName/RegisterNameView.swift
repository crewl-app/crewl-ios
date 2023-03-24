//
//  RegisterName.swift
//  Crewl
//
//  Created by NomoteteS on 7.02.2023.
//

import SwiftUI

struct RegisterNameView: View {
    
    @ObservedObject var viewModel : RegisterNameViewModel = .init()
    
    var body: some View {
        ZStack {
            //MARK: RegisterNameView - Check Status
            let falseStatus = (viewModel.name?.count ?? "".count > 2)
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack(spacing: 30) {
                //MARK: RegisterNameView - Header
                EntryHeader(title: "İsmin nedir?",
                            description: "Diğer Kullanıcılar sadece ismini görebilir.")
                VStack(spacing: 15) {
                    //MARK: RegisterNameView - TextFields
                    CustomTextField(text: "İsim",
                                    isTrue: $viewModel.isStatus,
                                    isActive: $viewModel.isStatusShow,
                                    textField: $viewModel.name.toUnwrapped(defaultValue: ""))
                    .keyboardType(.default)
                    CustomTextField(text: "Soyisim",
                                    isTrue: .constant(false),
                                    isActive: .constant(false),
                                    textField: $viewModel.surname.toUnwrapped(defaultValue: ""))
                    .keyboardType(.default)
                    //MARK: RegisterNameView - Error Massage
                    HStack(spacing: 5) {
                        Text("*").foregroundColor(.red)
                        Text("İsim kısmı boş olamaz.")
                            .font(.Rounded12)
                        Spacer()
                    }
                    .opacity(viewModel.isOpacityShown ? 1 : 0 )
                    .padding(.horizontal,40)
                }
                Spacer()
                //MARK: RegisterNameView - Buttons
                ZStack {
                    NavigationLink(isActive: $viewModel.isReadyToNextView) {
                        viewModel.router.navigate(name: viewModel.name ?? "", surname: viewModel.surname ?? "")
                    } label: {  }
                    HStack(spacing: 25) {
                        BackButton()
                        PrimaryButton(text: "Devam Et") {
                            viewModel.save()
                            if falseStatus {
                                viewModel.isOpacityShown = true
                                viewModel.isStatusShow = true
                            }
                        }
                    }
                }
            }
        }
    }
}

struct RegisterNameView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterNameView()
    }
}

