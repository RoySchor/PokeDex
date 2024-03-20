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
                        CapturedPokemonSectionView(capturedCards: $manager.capturedPokemonCards)
                    }
                }
                    
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
