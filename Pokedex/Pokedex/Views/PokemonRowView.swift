//
//  PokemonRowView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokemonRowView: View {
    var pokemonCard: PokemonCard
    
    var body: some View {
        let pokemon: Pokemon = pokemonCard.pokemon
        
        HStack {
            Text(String(pokemonCard.id))
            Spacer()
                .frame(width: 20)
            
            Text(pokemon.name)
                .font(.system(size: 15))
                .bold()
                .lineLimit(1)
            Spacer()
            
            PokemonImageView(pokemon: pokemon)
                .frame(width: 110, height: 110)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PokemonRowView(pokemonCard: Pokemon.standard.cards[0])
}
