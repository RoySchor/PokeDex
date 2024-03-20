//
//  PokedexHomeView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokedexHomeView: View {
    @EnvironmentObject var manager: PokedexManager
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedType: PokemonType? = nil
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Picker("Filter by Type", selection: $selectedType) {
                        Text("All").tag(PokemonType?.none)
                        ForEach(PokemonType.allCases, id: \.self) { type in
                            Text(type.rawValue.capitalized).tag(PokemonType?.some(type))
                        }
                    }
                }
                
                Section {
                    if !manager.capturedPokemonCards.isEmpty {
                        CapturedSectionView(capturedCards: $manager.capturedPokemonCards)
                    }
                }
                
                ForEach(selectedType == nil ? PokemonType.allCases : [selectedType!], id: \.self) { type in
                    if let cards = manager.pokemonCardsByType[type], !cards.isEmpty {
                        PokemonTypeSectionView(type: type, cards: cards)
                    }
                }
                
//                ForEach(PokemonType.allCases, id: \.self) { type in
//                    PokemonTypeSectionView(type: type, cards: manager.pokemonCardsByType[type]!)
//                }
                
                
//                ForEach(Array(manager.pokemonCards.enumerated()), id: \.element.id) { index, _ in
//                    NavigationLink(destination: PokemonDetailView(pokemonCard: manager.pokemonCards[index])) {
//                        PokedexCardView(pokemonCard: manager.pokemonCards[index])
//                            .environmentObject(manager)
//                    }
//                }
            }
            .background(Color.appBackground(for: colorScheme))
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    PokedexHomeView()
        .environmentObject(PokedexManager())
}
