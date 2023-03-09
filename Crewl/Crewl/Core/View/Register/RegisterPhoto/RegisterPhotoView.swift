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
                RegisterPhotoHeader()
                
                Spacer()
                
                //MARK: RegisterPhotoView - UserImage
                ZStack{
                    Circle()
                        .stroke(lineWidth: 3)
                        .background {
                            if let image = viewModel.userImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .clipShape(Circle())
                            }else{
                                Image.RegisterPhoto
                                    .resizable()
                                    .clipShape(Circle())
                            }
                        }
                }
                .padding(.all)
                
                //MARK: RegisterPhotoView - User ImagePicker Sections
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
                .padding()
                
                Spacer()
                
                //MARK: RegisterPhotoView - Buttons
                EntryButtonsCollected(isLoading: .constant(false),
                                      status: .constant(false)) {
                    
                } buttonAction: {
                    
                }
            }
            
        }
        .fullScreenCover(isPresented: $viewModel.isShowPicker) {
            ImagePicker(sourceType: viewModel.source == .gallery ? .photoLibrary : .camera, selectedImage: $viewModel.userImage)
                .ignoresSafeArea()
        }
    }
}

struct RegisterPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPhotoView()
    }
}


