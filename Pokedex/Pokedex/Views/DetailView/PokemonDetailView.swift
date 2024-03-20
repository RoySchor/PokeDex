//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokemonDetailView: View {
    var pokemonCard: PokemonCard
    
    var body: some View {
        let pokemon: Pokemon = pokemonCard.pokemon
        
        ScrollView {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    ZStack(alignment: .topLeading) {
                        PokemonImageView(pokemon: pokemon)
                            .frame(width: 350, height: 350)
                        
                        Image(pokemonCard.captured ? "closedPokeBall" : "openPokeBall")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .padding([.top, .leading], 10)
                    }
                    
                    Text("#" + String(pokemonCard.id))
                        .font(.system(size: 20, weight: .heavy))
                        .padding([.bottom, .trailing], 10)
                }
                
                StatView(pokemonHeight: pokemon.height, pokemonWeight: pokemon.weight)
                
                TypesWeaknessView(pokemon: pokemon)
                
                Text(pokemonCard.captured ? "Captured" : "Not Captured Yet...")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
            }
        }
        .navigationTitle(pokemon.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PokemonDetailView(pokemonCard: Pokemon.standard.cards[0])
}
