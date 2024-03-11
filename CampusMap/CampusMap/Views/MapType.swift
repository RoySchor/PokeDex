//
//  MapType.swift
//  CampusMap
//
//  Created by Roy Schor on 3/11/24.
//

import MapKit

enum MapType: Int {
    case standard = 0
    case hybrid
    case satellite

    func toMKMapType() -> MKMapType {
        switch self {
        case .standard:
            return .standard
        case .hybrid:
            return .hybrid
        case .satellite:
            return .satellite
        }
    }
}
