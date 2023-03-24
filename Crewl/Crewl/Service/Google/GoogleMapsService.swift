//
//  GoogleMapsService.swift
//  Crewl
//
//  Created by NomoteteS on 15.03.2023.
//

import SwiftUI
import GoogleMaps
import GooglePlaces
import CoreLocation

struct GoogleMap: UIViewRepresentable {

    @Binding var searchQuery: String
    @Binding var coordinate: CLLocationCoordinate2D?
    @Binding var isUserSearchingLocation: Bool
    @ObservedObject var locationService = LocationService()
    let mapView = GMSMapView()

    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 15.0)
        mapView.camera = camera
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {

        if isUserSearchingLocation {
            let camera = GMSCameraPosition(latitude: locationService.latitude, longitude: locationService.longitude, zoom: 15)

            mapView.camera = camera
        }

        // update coordinate when the search query changes
        if !searchQuery.isEmpty {
            let placesClient = GMSPlacesClient.shared()
            let filter = GMSAutocompleteFilter()

            placesClient.findAutocompletePredictions(fromQuery: searchQuery, filter: filter, sessionToken: nil) { (results, error) in
                guard error == nil else {
                    print("Autocomplete error: \(error!.localizedDescription)")
                    return
                }

                if let results = results, let firstResult = results.first {
                    let placeID = firstResult.placeID
                    placesClient.fetchPlace(fromPlaceID: placeID, placeFields: [.coordinate], sessionToken: nil) { (place, error) in
                        guard error == nil else {
                            print("Place details error: \(error!.localizedDescription)")
                            return
                        }

                        if let coordinate = place?.coordinate {
                            // set the result's coordinate
                            self.coordinate = coordinate

                            // move the camera to the coordinate
                            let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 15.0)
                            mapView.camera = camera
                        }
                    }
                }
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, GMSMapViewDelegate {
        var parent: GoogleMap

        init(_ parent: GoogleMap) {
            self.parent = parent
        }

        func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
            // update coordinate when the map region changes
            self.parent.coordinate = position.target
        }
    }
}


struct GoogleMapsService: UIViewRepresentable {
    
    let mapView = GMSMapView()
    @Binding var searchQuery: String
    @Binding var isGetUserLocation: Bool
    @Binding var userCoordinates: CLLocationCoordinate2D
    @ObservedObject var locationService = LocationService()
    
    //MARK: GoogleMapsService - Google Map View
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 39.9334, longitude: 32.8597, zoom: 5.5)
        mapView.camera = camera
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        return mapView
    }
    //MARK: GoogleMapsService - Update Map View
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        // Button to GetUserLocation
        if isGetUserLocation {
            let camera = GMSCameraPosition(latitude: locationService.latitude, longitude: locationService.longitude, zoom: 15.0)
            self.userCoordinates = CLLocationCoordinate2D(latitude: locationService.latitude, longitude: locationService.longitude)
            mapView.camera = camera
        }
        // String to GetUserLocation
        if !searchQuery.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                getUserLocationFromField(searchQuery: searchQuery)
            }
        }
    }
    
    func getUserLocationFromField(searchQuery: String) {
        let placesClient = GMSPlacesClient.shared()
        let filter = GMSAutocompleteFilter()
        placesClient.findAutocompletePredictions(fromQuery: searchQuery, filter: filter, sessionToken: nil) { (results, error) in
            guard error == nil else {
                print("Autocomplete error: \(error!.localizedDescription)")
                return
            }
            if let results = results, let firstResult = results.first {
                let placeID = firstResult.placeID
                placesClient.fetchPlace(fromPlaceID: placeID, placeFields: [.coordinate], sessionToken: nil) { (place, error) in
                    guard error == nil else {
                        print("Place details error: \(error!.localizedDescription)")
                        return
                    }
                    if let coordinate = place?.coordinate {
                        mapView.clear()
                        // set coordinate to coordinate
                        self.userCoordinates = coordinate
                        // move the camera to the coordinate
                        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 15.0)
                        mapView.camera = camera
                    }
                }
            }
        }
    }
}

//import SwiftUI
//import GoogleMaps
//
//struct MapView: UIViewRepresentable {
//
//    let locationManager = CLLocationManager()
//    let mapView = GMSMapView()
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//   
//
//    func makeUIView(context: Context) -> GMSMapView {
//        mapView.isMyLocationEnabled = true
//        mapView.delegate = context.coordinator
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//        return mapView
//    }
//
//    func updateUIView(_ uiView: GMSMapView, context: Context) {
//
//    }
//
//    class Coordinator: NSObject, GMSMapViewDelegate {
//        var parent: MapView
//
//        init(_ parent: MapView) {
//            self.parent = parent
//        }
//
//        func mapView(_ mapView: GMSMapView, didUpdate userLocation: GMSUserLocation) {
//            let camera = GMSCameraPosition.camera(withLatitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude, zoom: 15.0)
//            mapView.animate(to: camera)
//        }
//    }
//}
//
//struct ContentView: View {
//    @State private var searchText = ""
//    @State private var searchCoordinate: CLLocationCoordinate2D?
//
//    var body: some View {
//        VStack {
//            MapView()
//            HStack {
//                TextField("Search", text: $searchText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                Button(action: {
//                    searchForLocation()
//                }) {
//                    Text("Search")
//                }
//            }
//            Button(action: {
//                zoomToUserLocation()
//            }) {
//                Text("My Location")
//            }
//        }
//    }
//
//    func zoomToUserLocation() {
//        let locationManager = CLLocationManager()
//        if let location = locationManager.location {
//            let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 15.0)
//            searchCoordinate = location.coordinate
//            print("User Location - \(location.coordinate.latitude),\(location.coordinate.longitude)")
//        }
//    }
//
//    func searchForLocation() {
//        let geoCoder = CLGeocoder()
//        geoCoder.geocodeAddressString(searchText) { (placemarks, error) in
//            guard let placemark = placemarks?.first else { return }
//            self.searchCoordinate = placemark.location?.coordinate
//            let camera = GMSCameraPosition.camera(withLatitude: placemark.location!.coordinate.latitude, longitude: placemark.location!.coordinate.longitude, zoom: 15.0)
//            MapView().mapView.animate(to: camera)
//            print("Searched Location - \(placemark.location!.coordinate.latitude),\(placemark.location!.coordinate.longitude)")
//        }
//    }
//}
