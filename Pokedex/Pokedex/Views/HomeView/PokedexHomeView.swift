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
                        CapturedSectionView(capturedCards: $manager.capturedPokemonCards)
                    }
                }
                
                ForEach(PokemonType.allCases, id: \.self) { type in
                    PokemonTypeSectionView(type: type, cards: manager.pokemonCardsByType[type]!)
                }
                
                
//                THIS ONE WORKS VVV
//                ForEach(Array(manager.pokemonCards.enumerated()), id: \.element.id) { index, _ in
//                    NavigationLink(destination: PokemonDetailView(pokemonCard: manager.pokemonCards[index])) {
//                        PokedexCardView(pokemonCard: manager.pokemonCards[index])
//                            .environmentObject(manager)
//                    }
//                }
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
