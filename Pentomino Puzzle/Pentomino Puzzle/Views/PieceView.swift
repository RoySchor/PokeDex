//
//  PieceView.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/3/24.
//

import SwiftUI

struct PieceView: View {
    var piece: Piece
    var color: Color
    
    var body: some View {
        PentominoView(outline: piece.outline, color: color)
            .frame(width: CGFloat(piece.outline.size.width) * 20, height: CGFloat(piece.outline.size.height) * 20) // Assuming each unit block is 20x20 pixels
            .position(x: CGFloat(piece.position.x) * 20 + 10, y: CGFloat(piece.position.y) * 20 + 10) // Adjusting position, assuming 20 pixels per unit and a half-block offset for centering
    }
}

#Preview {
    PieceView(piece: Piece(position: Position(x: 35, y: 35), outline: PentominoOutline(name: "X", size: Size(width: 100, height: 100), outline: [Point(x: 15, y: 15)])), color: .yellow)

}
