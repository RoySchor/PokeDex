//
//  CapturedPokemonButton.swift
//  Pokedex
//
//  Created by Roy Schor on 3/19/24.
//

import SwiftUI

struct CapturedPokemonButton: View {
    @EnvironmentObject var manager: PokedexManager
    var pokemonCardID: String
    
    var body: some View {
        let isCaptured = manager.pokemonCards.first(where: { $0.id == pokemonCardID })?.captured ?? false
        
        VStack {
            Text(isCaptured ? "Captured" : "Not Captured Yet...")
                .font(.system(size: 25, weight: .heavy))
            
            Button(action: {
                manager.togglePokemonCapture(withID: pokemonCardID)
            }) {
                VStack {
                    PokeBallImageView(frameSize: manager.frameSizeForDetailView, pokemonCardID: pokemonCardID)
                        .environmentObject(manager)
                    
                    Text(isCaptured ? "Release Pokemon to the Wild?" : "Capture Pokemon?")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

#Preview {
    CapturedPokemonButton(pokemonCardID: PokemonCard.standard.id)
        .environmentObject(PokedexManager())
}
