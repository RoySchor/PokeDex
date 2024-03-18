//
//  PokedexManager.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import Foundation

class Pokedex: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    
    init() {
        loadPokemons()
    }
    
    func loadPokemons() {
        guard let url = Bundle.main.url(forResource: "pokedex", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            pokemons = try decoder.decode([Pokemon].self, from: data)
        } catch {
            print("Error loading Pokemons: \(error)")
        }
    }
}
