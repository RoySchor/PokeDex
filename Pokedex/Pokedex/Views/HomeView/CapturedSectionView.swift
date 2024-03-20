//
//  CapturedSectionView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/20/24.
//

import SwiftUI

struct CapturedSectionView: View {
    @Binding var capturedCards: [PokemonCard]
    
    var body: some View {
        Section(header: Text("Captured Pokémon")) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Array(capturedCards.enumerated()), id: \.element.id) { index, _ in
                        NavigationLink(destination: PokemonDetailView(pokemonCard: capturedCards[index])) {
                            PokedexCardView(pokemonCard: capturedCards[index])
                        }
                        .frame(width: 150, height: 225)
                        .padding(.leading, 10)
                    }
                }
            }
            .frame(height: 225)
        }
    }
}

#Preview {
    CapturedSectionView(capturedCards: .constant(Pokemon.standard.cards))
}
