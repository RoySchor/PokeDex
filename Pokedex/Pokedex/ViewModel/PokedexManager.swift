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
    @Published var pokemonCardsByType: [PokemonType: [PokemonCard]] = [:]
    
    @Published var frameSizeForCard = CGSize(width: 40, height: 40)
    @Published var frameSizeForDetailView = CGSize(width: 60, height: 60)
    
    init() {
        loadCapturedPokemonCards()
        loadPokemons()
    }
    
    func togglePokemonCapture(withID id: String) {
        guard let index = pokemonCards.firstIndex(where: { $0.id == id }) else { return }
        pokemonCards[index].captured.toggle()
        
        if pokemonCards[index].captured {
            if !capturedPokemonCards.contains(where: { $0.id == id }) {
                capturedPokemonCards.append(pokemonCards[index])
            }
        } else {
            if let capturedIndex = capturedPokemonCards.firstIndex(where: { $0.id == id }) {
                capturedPokemonCards.remove(at: capturedIndex)
            }
        }
        saveCapturedPokemonCards()
        self.objectWillChange.send()
    }
    
    func applyFilter(_ type: PokemonType?) {
        if let type = type {
            let filteredCards = pokemons.flatMap { $0.cards }.filter { $0.type == type }
            pokemonCardsByType = [type: filteredCards]
        } else {
            populatePokemonCards()
        }
    }
    
    func findPokemonCardByID(id: Int, ofType type: PokemonType) -> PokemonCard? {
        return pokemonCards.first { $0.pokemon.id == id && $0.type == type }
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
    
    func saveCapturedPokemonCards() {
        let fileManager = FileManager.default
        guard let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let persistedFileURL = directory.appendingPathComponent("capturedPokemonCards.json")
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(capturedPokemonCards)
            try data.write(to: persistedFileURL, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Error saving captured Pokémon cards: \(error)")
        }
    }
    
    func loadCapturedPokemonCards() {
        let fileManager = FileManager.default
        guard let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let persistedFileURL = directory.appendingPathComponent("capturedPokemonCards.json")
        
        guard let data = try? Data(contentsOf: persistedFileURL) else { return }
        
        let decoder = JSONDecoder()
        do {
            capturedPokemonCards = try decoder.decode([PokemonCard].self, from: data)
        } catch {
            print("Error loading captured Pokémon cards: \(error)")
        }
    }
    
    private func populatePokemonCards() {
        pokemonCards = pokemons.flatMap { $0.cards }
        pokemonCardsByType = Dictionary(uniqueKeysWithValues: PokemonType.allCases.map { ($0, [PokemonCard]()) })

        for card in pokemonCards {
            pokemonCardsByType[card.type]?.append(card)
        }
    }
}
