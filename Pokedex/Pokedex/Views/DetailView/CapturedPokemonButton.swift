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
        let isCaptured = manager.capturedPokemonCards.contains(where: { $0.id == pokemonCardID })
        
        VStack {
            Button(action: {
                withAnimation {
                    manager.togglePokemonCapture(withID: pokemonCardID)
                }
            }) {
                VStack {
                    PokeBallImageView(frameSize: manager.frameSizeForDetailView, pokemonCardID: pokemonCardID)
                        .environmentObject(manager)
                    
                    Text(isCaptured ? "Release Pokemon to the Wild?" : "Capture Pokemon?")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .animation(.default, value: isCaptured)
                }
                .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: isCaptured)
    }
}

#Preview {
    CapturedPokemonButton(pokemonCardID: PokemonCard.standard.id)
        .environmentObject(PokedexManager())
}
