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
    
//    init(latitude: Double, longitude: Double, name: String, opp_bldg_code: Int, photo: String?, year_constructed: Int?) {
//            self.latitude = latitude
//            self.longitude = longitude
//            self.name = name
//            self.opp_bldg_code = opp_bldg_code
//            self.photo = photo
//            self.year_constructed = year_constructed
//        }
//    
//    static let standardBuilding = Building(
//        latitude: 40.80379999807,
//        longitude: -77.8652166663766,
//        name: "Business Building",
//        opp_bldg_code: 23001,
//        photo: "businessbuilding",
//        year_constructed: 2005
//    )
}
