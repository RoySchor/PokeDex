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
            Text(String(pokemon.id))
            Spacer()
                .frame(width: 20)
            
            Text(pokemon.name)
                .font(.system(size: 15))
                .bold()
                .lineLimit(1)
            Spacer()
            
            PokemonImageView(pokemon: pokemon)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PokemonRowView(pokemon: Pokemon.standard)
}
