//
//  PokemonImageView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokemonImageView: View {
    var pokemon: Pokemon
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let colors = pokemon.types.map { Color(pokemonType: $0, colorScheme: colorScheme) }
        let gradient = LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)

        Image(pokemon.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(15)
            .background(gradient)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    PokemonImageView(pokemon: Pokemon.standard)
}
