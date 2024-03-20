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
            if pokemonCard.captured {
                Image("closedPokeBall")
                    .resizable()
                    .frame(width: 30, height: 30)
            } else {
                Image("openPokeBall")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            Text(String(pokemonCard.id))
                .font(.system(size: 12))
            Spacer()
                .frame(width: 10)
            
            Text(pokemon.name)
                .font(.system(size: 14))
                .bold()
                .lineLimit(1)
            Spacer()
            
            PokemonImageView(pokemon: pokemon)
                .frame(width: 90, height: 90)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PokemonRowView(pokemonCard: Pokemon.standard.cards[0])
}
