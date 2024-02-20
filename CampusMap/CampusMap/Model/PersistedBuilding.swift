//
//  PersistedBuilding.swift
//  CampusMap
//
//  Created by Roy Schor on 2/20/24.
//

import Foundation

struct PersistedBuildings: Codable {
    var favorites: [String]
    var selected: [String]
}
