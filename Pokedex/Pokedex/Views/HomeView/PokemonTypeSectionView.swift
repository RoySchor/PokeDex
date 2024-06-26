//
//  PokemonTypeSectionView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/20/24.
//

import SwiftUI

struct PokemonTypeSectionView: View {
    @EnvironmentObject var manager: PokedexManager
    var type: PokemonType
    var cards: [PokemonCard]
    
    var body: some View {
        Section(header: Text(type.rawValue)) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Array(cards.enumerated()), id: \.element.id) { index, _ in
                        NavigationLink(destination: PokemonDetailView(pokemonCard: cards[index])
                            .environmentObject(manager)
                        ) {
                            PokedexCardView(pokemonCard: cards[index])
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
    PokemonTypeSectionView(type: Pokemon.standard.types[0], cards: Pokemon.standard.cards)
        .environmentObject(PokedexManager())
}
