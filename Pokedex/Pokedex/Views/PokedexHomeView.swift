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
                                    ForEach(Array(manager.capturedPokemonCards.enumerated()), id: \.element.id) { index, _ in
                                        NavigationLink(destination: PokemonDetailView(pokemonCard: $manager.capturedPokemonCards[index])) {
                                            PokedexCardView(pokemonCard: manager.capturedPokemonCards[index])
                                        }
                                        .frame(width: 150, height: 100)
                                        .padding(.leading, 10)
                                    }
                                }
                            }
                        }
                    }
                }
                    
//                ForEach(Array(manager.pokemonCardsByType.keys).sorted(by: { $0.rawValue < $1.rawValue }), id: \.self) { type in
//                    if let cardsOfType = manager.pokemonCardsByType[type] {
//                        Section(header: Text(type.rawValue)) {
//                            ScrollView(.horizontal, showsIndicators: false) {
//                                HStack {
//                                    ForEach(cardsOfType, id: \.id) { card in
//                                        NavigationLink(destination: PokemonDetailView(pokemonCard: card)) {
//                                            PokedexCardView(pokemonCard: card)
//                                        }
//                                        .frame(width: 150, height: 100)
//                                        .padding(.leading, 10)
//                                    }
//                                }
//                            }
//                            .frame(height: 100)
//                        }
//                    }
//                }
                ForEach(Array(manager.pokemonCards.enumerated()), id: \.element.id) { index, _ in
                    NavigationLink(destination: PokemonDetailView(pokemonCard: $manager.pokemonCards[index])) {
                        PokedexCardView(pokemonCard: manager.pokemonCards[index])
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
