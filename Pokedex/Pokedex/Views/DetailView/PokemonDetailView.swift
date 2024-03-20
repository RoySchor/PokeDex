//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var manager: PokedexManager
    @Binding var pokemonCard: PokemonCard
    
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
                Spacer()
                    .frame(height: 15)
                
                CapturedPokemonButton(pokemonCard: $pokemonCard)
                    .environmentObject(manager)
            }
        }
        .navigationTitle(pokemon.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PokemonDetailView(pokemonCard: .constant(Pokemon.standard.cards[0]))
        .environmentObject(PokedexManager())
}
