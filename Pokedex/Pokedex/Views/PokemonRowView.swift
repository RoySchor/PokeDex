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
            Image(pokemonCard.captured ? "closedPokeBall" : "openPokeBall")
                .resizable()
                .frame(width: 30, height: 30)
            
            Text(pokemonCard.type.rawValue)
                .font(.system(size: 12))
            Spacer()
                .frame(width: 10)
            
            Text(pokemon.name)
                .font(.system(size: 15))
                .bold()
                .lineLimit(1)
            Spacer()
            
            PokemonImageView(pokemon: pokemon)
                .frame(width: 100, height: 100)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PokemonRowView(pokemonCard: Pokemon.standard.cards[0])
}
