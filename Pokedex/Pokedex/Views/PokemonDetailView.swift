//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokemonDetailView: View {
    var pokemon: Pokemon
    
    var body: some View {
        ScrollView {
            VStack {
                Text(pokemon.name)
                    .font(.largeTitle)
                PokemonImageView(pokemon: pokemon)
                    .frame(width: 500, height: 600)
            }
        }
        .navigationTitle(pokemon.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.standard)
}
