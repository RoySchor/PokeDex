//
//  PieceView.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/6/24.
//

import SwiftUI

struct PieceView: View {
    @EnvironmentObject var puzzleManager: PuzzleManager
    var piece: Piece
    

    var body: some View {
        let blockSize: CGFloat = puzzleManager.gridViewBlockSize
        
        PentominoView(outline: piece.outline, color: Color(piece: piece))
            .frame(width: CGFloat(piece.outline.size.width) * blockSize, height: CGFloat(piece.outline.size.height) * blockSize)
    }
}

#Preview {
    PieceView(piece: Piece(outline: PentominoOutline(name: "I", size: Size(width: 1, height: 5), outline: [Point(x: 0, y: 0), Point(x: 1, y: 0), Point(x: 1, y: 5), Point(x: 0, y: 5), Point(x: 0, y: 0)])))
        .environmentObject(PuzzleManager())
    
}
//PentominoOutline(name: "X", size: Size(width: 3, height: 3), outline: [Point(x: 1, y: 0), Point(x: 2, y: 0), Point(x: 2, y: 1), Point(x: 3, y: 1), Point(x: 3, y: 2), Point(x: 2, y: 2), Point(x: 2, y: 3), Point(x: 1, y: 3), Point(x: 1, y: 2), Point(x: 0, y: 2), Point(x: 0, y: 1), Point(x: 1, y: 1), Point(x: 1, y: 0)])
