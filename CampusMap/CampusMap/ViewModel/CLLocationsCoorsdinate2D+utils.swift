//
//  CLLocationsCoorsdinate2D+utils.swift
//  CampusMap
//
//  Created by Roy Schor on 2/26/24.
//

import Foundation
import MapKit

extension CLLocationCoordinate2D {
    static let oldMain = CLLocationCoordinate2D(latitude: 40.798214, longitude: -77.859909)
    
    init(coord: Coord) {
        self = CLLocationCoordinate2D(latitude: coord.latitude, longitude: coord.longitude)
    }
    
    var coord : Coord {
        Coord(latitude: self.latitude, longitude: self.longitude)
    }
    
}
