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
                ZStack(alignment: .bottomTrailing) {
                    PokemonImageView(pokemon: pokemon)
                        .frame(width: 350, height: 350)
                    
                    Text("#" + String(pokemon.id))
                        .font(.system(size: 20, weight: .heavy))
                        .padding([.bottom, .trailing], 10)
                }
                
                StatView(pokemonHeight: pokemon.height, pokemonWeight: pokemon.weight)
                
                TypesWeaknessView(pokemon: pokemon)
            }
        }
        .navigationTitle(pokemon.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.standard)
}
