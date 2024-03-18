//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

@main
struct PokedexApp: App {
    var pokedexManager = PokedexManager()
    
    var body: some Scene {
        WindowGroup {
            PokemonListView()
                .environmentObject(pokedexManager)
        }
    }
}
