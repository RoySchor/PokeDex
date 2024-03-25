//
//  EvolutionButtons.swift
//  Pokedex
//
//  Created by Roy Schor on 3/20/24.
//

import SwiftUI

struct EvolutionButtons: View {
    @EnvironmentObject var manager: PokedexManager
    var pokemonCard: PokemonCard
    
    var body: some View {
        HStack {
            PreEvolutionView(pokemonCard: pokemonCard)
                .environmentObject(manager)
            
            Spacer()
            
            NextEvolutionView(pokemonCard: pokemonCard)
                .environmentObject(manager)
        }
    }
}

#Preview {
    EvolutionButtons(pokemonCard: PokemonCard.standard)
        .environmentObject(PokedexManager())
}
