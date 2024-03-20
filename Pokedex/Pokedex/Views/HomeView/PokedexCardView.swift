//
//  PokedexCardView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokedexCardView: View {
    var pokemonCard: PokemonCard
    
    var body: some View {
        let pokemon: Pokemon = pokemonCard.pokemon
        
        VStack {
            PokemonImageView(pokemon: pokemon)
                .frame(width: 110, height: 110)
            
            Text(pokemon.name)
                .font(.system(size: 20))
                .bold()
                .lineLimit(1)
                .foregroundColor(.primary)
            
            HStack {
                Image(pokemonCard.captured ? "closedPokeBall" : "openPokeBall")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text(pokemonCard.type.rawValue)
                    .font(.system(size: 15))
                    .foregroundColor(.primary)
            }
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    PokedexCardView(pokemonCard: Pokemon.standard.cards[0])
}
