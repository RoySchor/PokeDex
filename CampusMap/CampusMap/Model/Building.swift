//
//  Building.swift
//  CampusMap
//
//  Created by Roy Schor on 2/19/24.
//

import Foundation

struct Building: Identifiable, Decodable {
    var id: UUID = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
    var yearConstructed: Int?
    var isFavorite: Bool = false
    var isSelected: Bool = false

    private enum CodingKeys: String, CodingKey {
        case name, latitude, longitude, yearConstructed = "year_constructed"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.yearConstructed = try container.decodeIfPresent(Int.self, forKey: .yearConstructed)
    }
}
