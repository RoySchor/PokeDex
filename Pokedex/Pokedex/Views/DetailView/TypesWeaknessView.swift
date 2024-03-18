//
//  TypesWeaknessView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct TypesWeaknessView: View {
    var pokemon: Pokemon
    
    var body: some View {
        VStack {
            Text("Types")
                .font(.system(size: 20, weight: .heavy))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(pokemon.types, id: \.self) { type in
                        CapsuleTextView(pokemonType: type)
                    }
                }
                .padding(.leading, 15)
            }
            
            Spacer()
                .frame(height: 30)
            
            Text("Weaknesses")
                .font(.system(size: 20, weight: .heavy))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(pokemon.weaknesses, id: \.self) { weakness in
                        CapsuleTextView(pokemonType: weakness)
                    }
                }
                .padding(.leading, 15)
            }
        }
    }
}

#Preview {
    TypesWeaknessView(pokemon: Pokemon.standard)
}
