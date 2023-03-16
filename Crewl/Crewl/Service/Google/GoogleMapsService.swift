//
//  GoogleMapsService.swift
//  Crewl
//
//  Created by NomoteteS on 15.03.2023.
//

import SwiftUI
import GoogleMaps

struct GoogleMapsService: UIViewRepresentable {
    
    @ObservedObject var locationService = LocationService()
    private let zoom: Float = 15.0
    
    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
                   let camera = GMSCameraPosition.camera(withLatitude: $locationService.latitude, longitude: $locationService.longitude, zoom: zoom)
                   mapView.camera = camera
           mapView.animate(toLocation: CLLocationCoordinate2D(latitude: locationService.latitude, longitude: locationService.longitude))
       }
}

struct GoogleMapsView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsService()
    }
}
