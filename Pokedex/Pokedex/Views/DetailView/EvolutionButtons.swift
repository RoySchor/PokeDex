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
    @State private var selectedPokemonCardForDetail: PokemonCard?
    
    var body: some View {
        let prevEvolutionExists = !(pokemonCard.pokemon.prevEvolution?.isEmpty ?? true)
        let nextEvolutionExists = !(pokemonCard.pokemon.nextEvolution?.isEmpty ?? true)
        
        HStack {
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
            
            Spacer()
            
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
}

#Preview {
    EvolutionButtons(pokemonCard: PokemonCard.standard)
        .environmentObject(PokedexManager())
}
