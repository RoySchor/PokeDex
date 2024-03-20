//
//  PokeBallImageView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/20/24.
//

import SwiftUI

struct PokeBallImageView: View {
    var frameSize: CGSize
    var captured: Bool
    
    var body: some View {
        Image(captured ? "closedPokeBall" : "openPokeBall")
            .resizable()
            .frame(width: frameSize.width, height: frameSize.height)
    }
}

#Preview {
    PokeBallImageView(frameSize: CGSize(width: 50, height: 50), captured: false)
}
