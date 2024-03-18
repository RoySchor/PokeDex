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
                    ForEach(manager.pokemons) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonRowView(pokemon: pokemon)
                        }
                    }
                }
            }
            .background(Color.appBackground(for: colorScheme))
            .navigationTitle("Pokedex")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Sort/Filter")
                }
            }
        }
    }
}

#Preview {
    PokedexListView()
        .environmentObject(PokedexManager())
}
