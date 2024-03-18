//
//  Pokemon.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    var id: Int
    var name: String
    var types: [PokemonType]
    var height: Double
    var weight: Double
    var weaknesses: [PokemonType]
    var prevEvolution: [Evolution]?
    var nextEvolution: [Evolution]?
    
    struct Evolution: Codable {
        var id: Int
    }
    
    var imageName: String {
        return String(format: "%03d", id)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, types, height, weight, weaknesses, prevEvolution, nextEvolution
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        types = try values.decode([PokemonType].self, forKey: .types)
        height = try values.decode(Double.self, forKey: .height)
        weight = try values.decode(Double.self, forKey: .weight)
        weaknesses = try values.decode([PokemonType].self, forKey: .weaknesses)
        prevEvolution = try values.decodeIfPresent([Evolution].self, forKey: .prevEvolution)
        nextEvolution = try values.decodeIfPresent([Evolution].self, forKey: .nextEvolution)
    }
}
