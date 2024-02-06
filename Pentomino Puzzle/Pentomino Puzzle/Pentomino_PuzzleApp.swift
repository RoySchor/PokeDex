//
//  Pentomino_PuzzleApp.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/3/24.
//

import SwiftUI

@main
struct Pentomino_PuzzleApp: App {
    var puzzleManager = PuzzleManager()
    
    var body: some Scene {
        WindowGroup {
            GameboardRootView()
                .environmentObject(puzzleManager)
        }
    }
}
