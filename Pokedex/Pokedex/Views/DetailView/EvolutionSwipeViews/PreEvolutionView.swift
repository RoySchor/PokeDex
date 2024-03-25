//
//  PreEvolutionView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/25/24.
//

import SwiftUI

struct PreEvolutionView: View {
    @EnvironmentObject var manager: PokedexManager
    var pokemonCard: PokemonCard
    
    var body: some View {
        let prevEvolutionExists = !(pokemonCard.pokemon.prevEvolution?.isEmpty ?? true)
        
        if prevEvolutionExists, let prevID = pokemonCard.pokemon.prevEvolution?.last, let wantedCard = manager.findPokemonCardByID(id: prevID, ofType: pokemonCard.type) {
            NavigationLink(
                destination: PokemonDetailView(pokemonCard: wantedCard)
                    .environmentObject(manager)
            ) {
                VStack {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .semibold))
                    Text("Pre-Evolution")
                }
                .foregroundColor(.primary)
                .padding()
            }
        } else {
            VStack {
                Image(systemName: "arrow.left")
                    .font(.system(size: 20, weight: .semibold))
                Text("Pre-Evolution")
            }
            .foregroundColor(.gray)
            .opacity(0.5)
            .padding()
        }
    }
}

#Preview {
    PreEvolutionView(pokemonCard: PokemonCard.standard)
        .environmentObject(PokedexManager())
}
