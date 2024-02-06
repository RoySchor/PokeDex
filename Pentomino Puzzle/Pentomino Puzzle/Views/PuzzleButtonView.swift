//
//  PuzzleButtonView.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/5/24.
//

import SwiftUI

struct PuzzleButtonView: View {
    @EnvironmentObject var puzzleManager: PuzzleManager
    var puzzleButtonImage: String
    
    var body: some View {
        Button(action: {
            if puzzleButtonImage == "Board0" {
                puzzleManager.currentPuzzle = nil
            } else if let puzzleOutline = puzzleManager.getPuzzleOutline(for: puzzleButtonImage) {
                puzzleManager.currentPuzzle = puzzleOutline
            }
        }) {
            Image(puzzleButtonImage)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding()
        }
    }
}

#Preview {
    PuzzleButtonView(puzzleButtonImage: "Board0")
        .environmentObject(PuzzleManager())
}
