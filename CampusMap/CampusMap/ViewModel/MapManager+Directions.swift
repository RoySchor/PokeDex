//
//  MapManager+Directions.swift
//  CampusMap
//
//  Created by Roy Schor on 2/26/24.
//

import Foundation
import MapKit

extension MapManager {
    func provideDirections(for building: Building) {
        
        let request = MKDirections.Request()
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationLocation!))
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceLocation!))
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            guard error == nil else {return}
            if let route = response?.routes.first {
                self.routes.append(route)
            }
        }
        
        
    }
    
    func calculateRoute(from startPoint: CLLocation, to endPoint: CLLocation) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceLocation!))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationLocation!))
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        directions.calculate { [weak self] (response, error) in
            guard let self = self, let route = response?.routes.first else { return }
            self.routes = [route]
            self.showRoute = true
        }
    }
    
//    func setStartPoint(_ location: CLLocationCoordinate2D?) {
    func setStartPoint(buildingName: String) {
        if let startBuilding = buildingByName(buildingName) {
            let startCoordinate = CLLocationCoordinate2D(latitude: startBuilding.latitude, longitude: startBuilding.longitude)
            
            self.sourceLocation = startCoordinate
        }
        
    }

    func setEndPoint(buildingName: String) {
        if let endBuilding = buildingByName(buildingName) {
            let endCoordinate = CLLocationCoordinate2D(latitude: endBuilding.latitude, longitude: endBuilding.longitude)
            self.destinationLocation = endCoordinate
        }
//        self.destinationLocation = location
    }
    
    func clearRoute() {
        self.routes = []
        self.showRoute = false
    }
    
}
