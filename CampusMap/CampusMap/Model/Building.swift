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
    var id: String { name }
    var latitude: Double
    var longitude: Double
    var name: String
    var opp_bldg_code: Int
    var photo: String?
    var year_constructed: Int?
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
        photo = try container.decodeIfPresent(String.self, forKey: .photo)
        year_constructed = try container.decodeIfPresent(Int.self, forKey: .year_constructed)
        isSelected = false
        isFavorite = false
    }
}

//extension Building {
//    struct PersistedBuildings: Codable {
//        var favorites: [String]
//        var selected: [String]
//    }
//}
