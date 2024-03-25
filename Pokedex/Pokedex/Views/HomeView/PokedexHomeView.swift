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
                FilterPokemonPickerView(selectedType: $selectedType)
                    .environmentObject(manager)
                
                Section {
                    if !manager.capturedPokemonCards.isEmpty {
                        CapturedSectionView(capturedCards: $manager.capturedPokemonCards)
                            .environmentObject(manager)
                    }
                }
                
                ForEach(selectedType == nil ? PokemonType.allCases : [selectedType!], id: \.self) { type in
                    if let cards = manager.pokemonCardsByType[type], !cards.isEmpty {
                        PokemonTypeSectionView(type: type, cards: cards)
                            .environmentObject(manager)
                    }
                }
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
