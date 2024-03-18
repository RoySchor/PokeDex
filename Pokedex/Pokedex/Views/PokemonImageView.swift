//
//  PokemonImageView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokemonImageView: View {
    var pokemon: Pokemon
    
    var body: some View {
        let colors = pokemon.types.map { Color(pokemonType: $0) }
        let gradient = LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)

        Image(pokemon.imageName)
            .background(gradient)
            .clipShape(RoundedRectangle(cornerRadius: 60))
    }
}

#Preview {
    PokemonImageView(pokemon: Pokemon.standard)
}
