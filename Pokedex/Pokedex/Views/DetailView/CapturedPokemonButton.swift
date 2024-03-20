//
//  CapturedPokemonButton.swift
//  Pokedex
//
//  Created by Roy Schor on 3/19/24.
//

import SwiftUI

struct CapturedPokemonButton: View {
    @EnvironmentObject var manager: PokedexManager
    @Binding var pokemonCard: PokemonCard
    
    var body: some View {
        VStack{
            Text(pokemonCard.captured ? "Captured" : "Not Captured Yet...")
                .font(.system(size: 25, weight: .heavy))
            
            Button(action: {
                if pokemonCard.captured {
                    manager.uncapturePokemon(withID: pokemonCard.id)
                } else {
                    manager.capturePokemon(withID: pokemonCard.id)
                }
            }) {
                VStack {
                    Image(pokemonCard.captured ? "closedPokeBall" : "openPokeBall")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text(pokemonCard.captured ? "Release Pokemon to the Wild?" : "Capture Pokemon?")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

#Preview {
    CapturedPokemonButton(pokemonCard: .constant(Pokemon.standard.cards[0]))
        .environmentObject(PokedexManager())
}
