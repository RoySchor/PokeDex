//
//  PokedexHomeView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokedexHomeView: View {
    @EnvironmentObject var manager: PokedexManager
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    if !manager.capturedPokemonCards.isEmpty {
                        Section(header: Text("Captured Pokémon")) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
//                                    ForEach(manager.capturedPokemonCards) { pokemonCard in
//                                        NavigationLink(destination: PokemonDetailView(pokemonCard: pokemonCard)) {
//                                            PokedexRowView(pokemonCard: pokemonCard)
//                                        }
//                                        .frame(width: 150, height: 100)
//                                    }
                                    
                                    ForEach(Array(manager.capturedPokemonCards.enumerated()), id: \.element.id) { index, _ in
                                        NavigationLink(destination: PokemonDetailView(pokemonCard: $manager.capturedPokemonCards[index])) {
                                            PokedexRowView(pokemonCard: manager.capturedPokemonCards[index])
                                        }
                                        .frame(width: 150, height: 100)
                                    }
                                }
                            }
                            .frame(height: 100)
                        }
                    }
                    
//                    ForEach(manager.pokemonCards) { pokemonCard in
//                        NavigationLink(destination: PokemonDetailView(pokemonCard: pokemonCard)) {
//                            PokedexRowView(pokemonCard: pokemonCard)
//                        }
//                    }
                    ForEach(Array(manager.pokemonCards.enumerated()), id: \.element.id) { index, _ in
                        NavigationLink(destination: PokemonDetailView(pokemonCard: $manager.pokemonCards[index])) {
                            PokedexRowView(pokemonCard: manager.pokemonCards[index])
                        }
                    }
                }
            }
            .background(Color.appBackground(for: colorScheme))
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    PokedexHomeView()
        .environmentObject(PokedexManager())
}
