//
//  RegisterLocationView.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI
import CoreLocation

//TODO: Kullanıcın lokasyonu Otomatik işaret ile alabiliyoruz.
//TODO: Kullanıcın SearchField ile aradığında alt tarafnta liste ile çıkması gerekir iken aynı zamanda aradığı yere göre yer çıkmıyor.
//TODO: Kullanıcı verileri alamıyruz.

struct RegisterLocationView: View {
    
    @StateObject var viewModel: RegisterLocationViewModel
    @State var location = CLLocationCoordinate2D()
    var coordinateBinding: Binding<CLLocationCoordinate2D> {
        Binding<CLLocationCoordinate2D>(
            get: { self.location },
            set: { self.location = $0 }
        )
    }
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                //MARK: RegisterLocationView - Header
                EntryHeader(title: "Şu an neredesin?",
                            description: "Diğer kullanıcılar lokasyonunu göremez.")
                //MARK: RegisterLocationView - Searching
                CustomTextField(text: "Ankara",
                                isTrue: .constant(false),
                                isActive: .constant(false),
                                textField: $viewModel.userPlace,
                                image: "magnifyingglass")
                //MARK: RegisterLocationView - Map
                ZStack {
                    Circle()
                        .stroke(lineWidth: 3)
                        .background{
                            GoogleMapsService(searchQuery: $viewModel.userPlace,
                                              isGetUserLocation: $viewModel.isCheckOwnLocation,
                                              userCoordinates: $location)
                                .clipShape(Circle())
                        }
                        .padding(.leading)
                }
                .padding(.all)
                .clipShape(Circle())
                //MARK: RegisterLocationView - SecondryButton
                SecondryButton(text: "Otomatik İşaretle",
                               action: {
                    viewModel.isCheckOwnLocation.toggle()
                })
                .padding(.vertical)
                Spacer()                
                EntryButtonsCollected(isLoading: .constant(false),
                                      status: .constant(false)) {
                    
                } buttonAction: {
                    
                }
            }
        }
    }
}

struct RegisterLocationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterLocationView(viewModel: .init(nameData: "",
                                              surnameData: "",
                                              genderData: "",
                                              birthData: "",
                                              userPlace: ""))
    }
}
