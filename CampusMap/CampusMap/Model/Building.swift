//
//  Building.swift
//  CampusMap
//
//  Created by Roy Schor on 2/19/24.
//

import Foundation
import MapKit

struct Building: Identifiable, Decodable, Hashable {
    var id: String { name }
    var latitude: Double
    var longitude: Double
    var name: String
    var opp_bldg_code: Int
    var year_constructed: Int?
    var photo: String?
    var isSelected: Bool = false
    var isFavorite: Bool = false

    enum CodingKeys: String, CodingKey {
        case latitude, longitude, name, opp_bldg_code, year_constructed, photo
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        name = try container.decode(String.self, forKey: .name)
        opp_bldg_code = try container.decode(Int.self, forKey: .opp_bldg_code)
        year_constructed = try container.decodeIfPresent(Int.self, forKey: .year_constructed)
        photo = try container.decodeIfPresent(String.self, forKey: .photo)
        isSelected = false
        isFavorite = false
    }
}

//extension Building {
//    var coordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//    }
//}
