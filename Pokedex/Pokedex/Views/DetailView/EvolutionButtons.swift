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
            NavigationLink(destination: PokemonDetailView(pokemonCard: selectedPokemonCardForDetail ?? pokemonCard)) {
                EmptyView()
            }.hidden()

            
            Button(action: {
                if prevEvolutionExists, let prevID = pokemonCard.pokemon.prevEvolution?.last, let wantedCard = manager.findPokemonCardByID(id: prevID, ofType: pokemonCard.type) {
                    self.selectedPokemonCardForDetail = wantedCard
                }
            }) {
                VStack {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.primary)
                    Text("Pre-Evolution")
                        .foregroundColor(.primary)
                }
            }
            .opacity(prevEvolutionExists ? 1.0 : 0.5)
            .disabled(!prevEvolutionExists)
            
            Spacer()
                
            Button(action: {
                if nextEvolutionExists, let prevID = pokemonCard.pokemon.prevEvolution?.first, let wantedCard = manager.findPokemonCardByID(id: prevID, ofType: pokemonCard.type) {
                    self.selectedPokemonCardForDetail = wantedCard
                }
//                if nextEvolutionExists {
//                    var pokemonId = pokemonCard.pokemon.nextEvolution?.first
//                    var pokemonType = pokemonCard.type
//                    if let wantedCard = manager.findPokemonCardByID(id: pokemonId!, ofType: pokemonType) {
//                        PokemonDetailView(pokemonCard: wantedCard)
//                    }
//                }
            }) {
                VStack {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.primary)
                    Text("Next-Evolution")
                        .foregroundColor(.primary)
                }
            }
            .opacity(nextEvolutionExists ? 1.0 : 0.5)
            .disabled(!nextEvolutionExists)
        }
        .padding()
    }
}

#Preview {
    EvolutionButtons(pokemonCard: PokemonCard.standard)
        .environmentObject(PokedexManager())
}
