//
//  PokemonCard.swift
//  Pokedex
//
//  Created by Roy Schor on 3/19/24.
//

import Foundation

struct PokemonCard: Codable, Identifiable {
    var id: String {
        "\(pokemon.id)-\(type.rawValue)"
    }
    var pokemon: Pokemon
    var type: PokemonType
    var captured: Bool = false
    
    static let standard = PokemonCard(
        pokemon: Pokemon.standard,
        type: Pokemon.standard.types[0],
        captured: false
    )
}
