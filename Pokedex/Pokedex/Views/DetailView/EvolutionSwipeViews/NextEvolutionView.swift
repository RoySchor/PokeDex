//
//  NextEvolutionView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/25/24.
//

import SwiftUI

struct NextEvolutionView: View {
    @EnvironmentObject var manager: PokedexManager
    var pokemonCard: PokemonCard
    
    var body: some View {
        let nextEvolutionExists = !(pokemonCard.pokemon.nextEvolution?.isEmpty ?? true)
        
        if nextEvolutionExists, let prevID = pokemonCard.pokemon.nextEvolution?.first, let wantedCard = manager.findPokemonCardByID(id: prevID, ofType: pokemonCard.type) {
            NavigationLink(
                destination: PokemonDetailView(pokemonCard: wantedCard)
                    .environmentObject(manager)
            ) {
                VStack {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 20, weight: .semibold))
                    Text("Next-Evolution")
                }
                .foregroundColor(.primary)
                .padding()
            }
        } else {
            VStack {
                Image(systemName: "arrow.right")
                    .font(.system(size: 20, weight: .semibold))
                Text("Next-Evolution")
            }
            .foregroundColor(.gray)
            .opacity(0.5)
            .padding()
        }
    }
}

#Preview {
    NextEvolutionView(pokemonCard: PokemonCard.standard)
        .environmentObject(PokedexManager())
}
