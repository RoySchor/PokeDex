//
//  StatView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct StatView: View {
    var pokemonHeight: Double
    var pokemonWeight: Double
    
    var body: some View {
        HStack {
            StatComponentView(label: "Height", value: String(pokemonHeight))
            StatComponentView(label: "Weight", value: String(pokemonWeight))
        }
    }
}

#Preview {
    StatView(pokemonHeight: Pokemon.standard.height, pokemonWeight: Pokemon.standard.weight)
}
