//
//  CapsuleTextView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct CapsuleTextView: View {
    let pokemonType: PokemonType
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text(pokemonType.rawValue)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(pokemonType: pokemonType, colorScheme: colorScheme))
            .clipShape(Capsule())
            .foregroundColor(.white)
            .font(.system(size: 15, weight: .bold, design: .default))
    }
}

#Preview {
    CapsuleTextView(pokemonType: Pokemon.standard.types[0])
}
