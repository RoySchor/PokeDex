//
//  PokeBallImageView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/20/24.
//

import SwiftUI

struct PokeBallImageView: View {
    @EnvironmentObject var manager: PokedexManager
    var frameSize: CGSize
    var pokemonCardID: String
    
    var body: some View {
        let isCaptured = manager.pokemonCards.first(where: { $0.id == pokemonCardID })?.captured ?? false
        
        Image(isCaptured ? "closedPokeBall" : "openPokeBall")
            .resizable()
            .frame(width: frameSize.width, height: frameSize.height)
    }
}

#Preview {
    PokeBallImageView(frameSize: CGSize(width: 50, height: 50), pokemonCardID: PokemonCard.standard.id)
}
