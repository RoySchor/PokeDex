//
//  PiecesGridView.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/6/24.
//

import SwiftUI

struct PiecesGridView: View {
    @EnvironmentObject var puzzleManager : PuzzleManager

    private var gridItems: [GridItem] = Array(repeating: .init(.flexible(), spacing: 10), count: 4)
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 50) {
            ForEach(puzzleManager.pieces, id: \.outline.name) { piece in
                PieceView(piece: piece)
            }
        }
        .padding()
    }
}

#Preview {
    PiecesGridView()
        .environmentObject(PuzzleManager())
}

