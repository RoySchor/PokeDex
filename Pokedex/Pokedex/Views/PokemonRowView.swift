//
//  PokemonRowView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokemonRowView: View {
    var pokemon: Pokemon
    
    var body: some View {
        HStack {
            Text(String(format: "#%03d", pokemon.id))
            Text(pokemon.name)
            Spacer()
            PokemonImageView(pokemon: pokemon)
                .frame(width: 50, height: 50)
        }
    }
}

#Preview {
    PokemonRowView(pokemon: Pokemon.standard)
}
