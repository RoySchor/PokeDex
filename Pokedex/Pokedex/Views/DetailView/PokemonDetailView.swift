//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct PokemonDetailView: View {
    var pokemon: Pokemon
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    PokemonImageView(pokemon: pokemon)
                        .frame(width: 350, height: 350)
                    
                    Text("#" + String(pokemon.id))
                        .font(.system(size: 20, weight: .heavy))
                        .padding([.bottom, .trailing], 10)
                }
                
                HStack {
                    StatView(label: "Height", value: String(pokemon.height))
                    StatView(label: "Weight", value: String(pokemon.weight))
                }
                
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
        .navigationTitle(pokemon.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.standard)
}
