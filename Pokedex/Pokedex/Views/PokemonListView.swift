//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokemonListView: View {
    @EnvironmentObject var manager: PokedexManager
    
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
    PokemonListView()
        .environmentObject(PokedexManager())
}
