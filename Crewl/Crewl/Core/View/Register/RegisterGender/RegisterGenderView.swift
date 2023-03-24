//
//  RegisterGenderView.swift
//  Crewl
//
//  Created by NomoteteS on 4.03.2023.
//

import SwiftUI

struct RegisterGenderView: View {
    
    @StateObject var viewModel: RegisterGenderViewModel
    
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                //MARK: RegisterGenderView - Header
                EntryHeader(title: "Cinsiyetin Nedir?")
                //MARK: RegisterGenderView - Gender Section
                //TODO: Tek cinsiyeti seçme ve genderların ortalama (Tasarıma uygun değil.)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.registerGenderItems,id: \.genderName) { item in
                            RegisterGenderPickerView(genderName: item.genderName,
                                                     genderImage: item.genderImage,
                                                     isClicked: (viewModel.gender == item.genderName))
                            .padding(.horizontal)
                            .onTapGesture {
                                viewModel.gender = item.genderName
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
                .scaledToFit()
                Spacer()
                //MARK: RegisterGenderView - Button
                let status = (viewModel.gender != "")
                ZStack {
                    NavigationLink(isActive: $viewModel.isReadyToNextView) {
                        viewModel.router.navigate(nameData: viewModel.nameData,
                                                  surnameData: viewModel.surnameData,
                                                  genderData: viewModel.gender)
                    } label: {  }
                    EntryButtonsCollected(isLoading: .constant(false),
                                          status: .constant(status)) {
                    } buttonAction: {
                        viewModel.isReadyToNextView.toggle()
                    }
                }
            }
        }
    }
}

struct RegisterGenderView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterGenderView(viewModel: .init(nameData: "Mert", surnameData: "Türedü"))
    }
}
