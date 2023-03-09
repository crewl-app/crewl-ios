//
//  LocationService.swift
//  Crewl
//
//  Created by NomoteteS on 7.03.2023.
//

import Foundation

import CoreLocation


class LocationService: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationService()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("--> restricted")
        case .restricted:
            print("--> restricted")
        case .denied:
            print("--> restricted")
        case .authorizedAlways:
            print("--> restricted")
        case .authorizedWhenInUse:
            print("--> restricted")
        case .authorized:
            print("--> restricted")
        @unknown default:
            fatalError()
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocation locations: [CLLocation]) {
            guard let location = locations.last else {return}
            self.userLocation = location
        }
    }
}
