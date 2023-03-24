//
//  RegisterPhotoView.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

struct RegisterPhotoView: View {
    
    @StateObject var viewModel: RegisterPhotoViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                //MARK: RegisterPhotoView - Header
                EntryHeader(title: "Fotoğrafını yükle.",
                            description: "Lütfen yüzünün gözüktüğü bir fotoğrafını yükle.\n Fotoğrafını istediğin zaman değiştirebilirsin.")
                //MARK: RegisterPhotoView - UserImage
                ZStack{
                    Circle()
                        .stroke(lineWidth: 3)
                        .background {
                            if let image = viewModel.userImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .clipShape(Circle())
                            }
                        }
                        .background{
                            Image("registerPhoto")
                                .resizable()
                                .padding(.all,-20)
                                .clipShape(Circle())
                        }
                }
                .padding(.all)
                //MARK: RegisterPhotoView - User ImagePickerService Sections
                HStack {
                    Spacer()
                    SecondryButton(text: "Galeriden Seç") {
                        viewModel.source = .gallery
                        viewModel.isShowPicker.toggle()
                    }
                    .padding(.trailing,50)
                    SecondryButton(text: "Fotoğraf Çek") {
                        viewModel.source = .camera
                        viewModel.isShowPicker.toggle()
                    }
                    Spacer()
                }
                .padding(.bottom)
                .padding()
                Spacer()
                //MARK: RegisterPhotoView - Buttons
                let status = (viewModel.userImage != nil)
                ZStack {
                    NavigationLink(isActive: $viewModel.isReadyToNextView) {
                        //CRASH: RegisterPhotoView - Preview Sim Crash Blocker
//                        viewModel.router.navigate()
                    } label: {  }
                    EntryButtonsCollected(isLoading: .constant(false),
                                          status: .constant(status)) {
                        
                    } buttonAction: {
                        viewModel.isReadyToNextView.toggle()
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $viewModel.isShowPicker) {
            ImagePickerService(sourceType: viewModel.source == .gallery ? .photoLibrary : .camera, selectedImage: $viewModel.userImage)
                .ignoresSafeArea()
        }
    }
}

struct RegisterPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPhotoView()
    }
}


