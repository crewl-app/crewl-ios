//
//  RegisterLocationViewModel.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import Foundation
import CoreLocation

typealias RegisterLocationPromoter = RegisterLocationRouter
//TODO: RegisterName ViewModel Benzet
class RegisterLocationViewModel: ObservableObject {

    //TODO: Tekrardan düzenlenecek
    @Published var nameData: String
    @Published var surnameData: String
    @Published var genderData: String
    @Published var birthData: String
    
    @Published var searchLocationField: String
    @Published var userPlace: String
    @Published var longitude: Double
    @Published var latitude: Double
    @Published var isReadyToNextView: Bool
    @Published var isCheckOwnLocation: Bool
    
    init(nameData: String,
         surnameData: String,
         genderData: String,
         birthData: String,
         searchLocationField: String = "",
         userPlace: String = "",
         longitude: Double = 0.0,
         latitude: Double = 0.0,
         isReadyToNextView: Bool = false,
         isCheckOwnLocation: Bool = false) {
        self.nameData = nameData
        self.surnameData = surnameData
        self.genderData = genderData
        self.birthData = birthData
        self.searchLocationField = searchLocationField
        self.userPlace = userPlace
        self.longitude = longitude
        self.latitude = latitude
        self.isReadyToNextView = isReadyToNextView
        self.isCheckOwnLocation = isCheckOwnLocation
    }
    
    func getUserCoordinate() -> CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    
}
