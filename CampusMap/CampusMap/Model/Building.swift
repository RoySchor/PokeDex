//
//  Building.swift
//  CampusMap
//
//  Created by Roy Schor on 2/19/24.
//

import Foundation
import MapKit

struct Coord {
    var latitude : Double
    var longitude : Double
}

struct Building: Identifiable, Codable, Hashable {
    var id: String {
        if customMarker {
            return "\(latitude),\(longitude)"
        } else {
            return name
        }
    }
//    var id: String { name }
    var latitude: Double
    var longitude: Double
    var name: String
    var opp_bldg_code: Int
    var photo: String?
    var year_constructed: Int?
    var isSelected: Bool = false
    var isFavorite: Bool = false
    var customMarker: Bool = false

    enum CodingKeys: String, CodingKey {
        case latitude, longitude, name, opp_bldg_code, year_constructed, photo
    }
    
    var mapItem: MKMapItem {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
        return MKMapItem(placemark: placemark)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        name = try container.decode(String.self, forKey: .name)
        opp_bldg_code = try container.decode(Int.self, forKey: .opp_bldg_code)
        photo = try container.decodeIfPresent(String.self, forKey: .photo)
        year_constructed = try container.decodeIfPresent(Int.self, forKey: .year_constructed)
        isSelected = false
        isFavorite = false
    }
    
    init(latitude: Double, longitude: Double, name: String, opp_bldg_code: Int, photo: String? = nil, year_constructed: Int?, isSelected: Bool = false, isFavorite: Bool = false) {
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.opp_bldg_code = opp_bldg_code
        self.photo = photo
        self.year_constructed = year_constructed
        self.isSelected = isSelected
        self.isFavorite = isFavorite
    }
    
    init(latitude: Double, longitude: Double, name: String = "Custom Location", customMarker: Bool = true) {
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.opp_bldg_code = 0
        self.customMarker = customMarker
    }
    
    // Static instance for previews
    static let standard = Building(
        latitude: 40.7964685139719,
        longitude: -77.8628317618596,
        name: "Old Main",
        opp_bldg_code: 1000,
        year_constructed: 1930
    )
}
