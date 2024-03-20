//
//  PokedexListView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokedexListView: View {
    @EnvironmentObject var manager: PokedexManager
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(manager.pokemonCards) { pokemonCard in
                        NavigationLink(destination: PokemonDetailView(pokemonCard: pokemonCard)) {
                            PokemonRowView(pokemonCard: pokemonCard)
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
    PokedexListView()
        .environmentObject(PokedexManager())
}
