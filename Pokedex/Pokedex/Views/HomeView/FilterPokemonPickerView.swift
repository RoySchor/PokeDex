//
//  FilterPokemonPickerView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/20/24.
//

import SwiftUI

struct FilterPokemonPickerView: View {
    @EnvironmentObject var manager: PokedexManager
    @Binding var selectedType: PokemonType?
    
    var body: some View {
        Section {
            Picker("Filter by Type", selection: $selectedType) {
                Text("All").tag(PokemonType?.none)

                ForEach(PokemonType.allCases, id: \.self) { type in
                    Text(type.rawValue.capitalized).tag(PokemonType?.some(type))
                }
            }
        }
    }
}

#Preview {
    FilterPokemonPickerView(selectedType: .constant(nil))
        .environmentObject(PokedexManager())
}
