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
            let falseStatus = (viewModel.name?.count == nil)
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack(spacing: 30) {
                //MARK: RegisterNameView - Title & Description
                RegisterNameViewHeader()
                    .padding(.top)
                VStack(spacing: 15) {
                    //MARK: RegisterNameView - TextFields
                    CustomTextField(text: "İsim",
                                    isTrue: $viewModel.isStatus,
                                    isActive: $viewModel.isStatusShow,
                                    textField: $viewModel.name.toUnwrapped(defaultValue: ""))
                    CustomTextField(text: "Soyisim",
                                    isTrue: .constant(false),
                                    isActive: .constant(false),
                                    textField: $viewModel.surname.toUnwrapped(defaultValue: ""))
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
                    HStack(spacing: 25) {
                        BackButton()
                        PrimaryButton(text: "Devam Et") {
                            if falseStatus {
                                viewModel.isOpacityShown = true
                                viewModel.isStatusShow = true
                            }
                        }
                    }
                    NavigationLink(isActive: $viewModel.isReadyToNextView) {
                        viewModel.router.navigate(name: viewModel.name!, surname: viewModel.surname ?? "")
                    } label: {  }
                }
            }
        }
    }
}


struct RegisterName_Previews: PreviewProvider {
    static var previews: some View {
        RegisterNameView()
    }
}

