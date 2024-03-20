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
    var prevEvolution: [Int]?
    var nextEvolution: [Int]?
    
    var imageName: String {
        return String(format: "%03d", id)
    }
    
    var cards: [PokemonCard] {
        types.map { PokemonCard(pokemon: self, type: $0, captured: false) }
    }
    
    static let standard = Pokemon(
        id: 1,
        name: "Bulbasaur",
        types: [.grass, .poison],
        height: 0.71,
        weight: 6.9,
        weaknesses: [.fire, .ice, .flying, .psychic],
        prevEvolution: nil,
        nextEvolution: [2, 3]
    )
}

extension Pokemon {
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
        prevEvolution = try values.decodeIfPresent([Int].self, forKey: .prevEvolution)
        nextEvolution = try values.decodeIfPresent([Int].self, forKey: .nextEvolution)
    }
}
