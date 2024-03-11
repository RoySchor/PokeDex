//
//  MapManager+Directions.swift
//  CampusMap
//
//  Created by Roy Schor on 2/26/24.
//

import Foundation
import MapKit

extension MapManager {
    func calculateRoute() {
        let request = MKDirections.Request()
        
        if let sourceLocation = self.sourceLocation {
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceLocation))
        } else if let userLocation = locationManager.location?.coordinate {
            let userPlacemark = MKPlacemark(coordinate: userLocation)
            request.source = MKMapItem(placemark: userPlacemark)
        }

        
        if let destinationLocation = self.destinationLocation {
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationLocation))
        } else if let userLocation = locationManager.location?.coordinate {
            let userPlacemark = MKPlacemark(coordinate: userLocation)
            request.destination = MKMapItem(placemark: userPlacemark)
        }
        
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            guard error == nil else {return}
            if let route = response?.routes.first {
                self.route = route
            }
        }
    }
    
    func setStartPoint(buildingName: String) {
        if buildingName == "Current Location" {
            self.sourceLocation = nil
        } else if let startBuilding = buildingByName(buildingName) {
            self.sourceLocationBuilding = startBuilding
            
            let startCoordinate = CLLocationCoordinate2D(latitude: startBuilding.latitude, longitude: startBuilding.longitude)
            self.sourceLocation = startCoordinate
        }
    }

    func setEndPoint(buildingName: String) {
        if buildingName == "Current Location" {
            self.destinationLocation = nil
        } else if let endBuilding = buildingByName(buildingName) {
            self.destinationLocationBuilding = endBuilding
            
            let endCoordinate = CLLocationCoordinate2D(latitude: endBuilding.latitude, longitude: endBuilding.longitude)
            self.destinationLocation = endCoordinate
        }
    }
    
    func clearRoute() {
        self.route = nil
        self.sourceLocation = nil
        self.destinationLocation = nil
        self.sourceLocationBuilding = nil
        self.destinationLocationBuilding = nil
        self.showRoute = false
    }
    
}
