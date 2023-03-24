//
//  LocationService.swift
//  Crewl
//
//  Created by NomoteteS on 7.03.2023.
//

import CoreLocation
import Combine


class LocationService: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var location: CLLocation? {
        willSet { objectWillChange.send() }
    }
 
    static let shared = LocationService()
    
    var latitude: CLLocationDegrees {
        return location?.coordinate.latitude ?? 0
    }
    
    var longitude: CLLocationDegrees {
        return location?.coordinate.longitude ?? 0
    }
    
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
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           guard let location = locations.last else { return }
           self.location = location
       }
}
