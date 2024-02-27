//
//  MapManager+Location.swift
//  CampusMap
//
//  Created by Roy Schor on 2/26/24.
//

import Foundation
import CoreLocation
import MapKit

extension MapManager: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
        default:
            manager.stopUpdatingLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let location = locations.first else { return }
        userLocation = location
        if centerOnUserLocation {
            centerMapOnUserLocation()
        }
    }
    
    func centerMapOnUserLocation() {
        guard let userLocation = userLocation else { return }
        let region = MKCoordinateRegion(center: userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        self.region = region
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
