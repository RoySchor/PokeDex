//
//  PokedexCardView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokedexCardView: View {
    @EnvironmentObject var manager: PokedexManager
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
                PokeBallImageView(frameSize: manager.frameSizeForCard, pokemonCardID: pokemonCard.id)
                    .environmentObject(manager)
                
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
