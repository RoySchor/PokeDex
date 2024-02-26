//
//  MapManager+Location.swift
//  CampusMap
//
//  Created by Roy Schor on 2/26/24.
//

import Foundation
import CoreLocation

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

    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.first else { return }
//        self.userLocation = location.coordinate
//    }
//    
////    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
////        switch manager.authorizationStatus {
////            case .notDetermined, .restricted, .denied:
////                print("Location access denied or restricted")
////            case .authorizedWhenInUse, .authorizedAlways:
////                locationManager.startUpdatingLocation()
////            @unknown default:
////                fatalError("Unhandled case in locationManagerDidChangeAuthorization")
////        }
////    }
//    
//    func centerOnUserLocation() {
//        guard let userLocation = self.userLocation else { return }
//        let region = MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//        self.camera = .region(region)
//    }
//    
//}
