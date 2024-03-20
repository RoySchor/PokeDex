//
//  PokedexManager.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import Foundation

class PokedexManager: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var pokemonCards: [PokemonCard] = []
    @Published var capturedPokemonCards: [PokemonCard] = []
    
    init() {
        loadPokemons()
    }
    
    func capturePokemon(withID id: String) {
        guard let index = pokemonCards.firstIndex(where: { $0.id == id }) else { return }
        pokemonCards[index].captured = true
        
        if !capturedPokemonCards.contains(where: { $0.id == id }) {
            capturedPokemonCards.append(pokemonCards[index])
        }
    }

    func uncapturePokemon(withID id: String) {
        guard let index = pokemonCards.firstIndex(where: { $0.id == id }) else { return }
        pokemonCards[index].captured = false

        if let capturedIndex = capturedPokemonCards.firstIndex(where: { $0.id == id }) {
            capturedPokemonCards.remove(at: capturedIndex)
        }
    }
    
    func loadPokemons() {
        guard let url = Bundle.main.url(forResource: "pokedex", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            pokemons = try decoder.decode([Pokemon].self, from: data)
            
            populatePokemonCards()
        } catch {
            print("Error loading Pokemons: \(error)")
        }
    }
    
    private func populatePokemonCards() {
        pokemonCards = pokemons.flatMap { $0.cards }
    }
}
