//
//  PieceView.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/6/24.
//

import SwiftUI

struct PieceView: View {
    @EnvironmentObject var puzzleManager: PuzzleManager
    @State private var dragOffset: CGSize = .zero
    @State private var isDragging: Bool = false
    var piece: Piece

    var body: some View {
        let blockSize: CGFloat = puzzleManager.gridViewBlockSize
        let piecePosition = CGPoint(x: CGFloat(piece.position.x) * blockSize, y: CGFloat(piece.position.y) * blockSize)

        
        PentominoView(outline: piece.outline, color: Color(piece: piece))
            .frame(width: CGFloat(piece.outline.size.width) * blockSize, height: CGFloat(piece.outline.size.height) * blockSize)
            .scaleEffect(isDragging ? 1.2 : 1.0)
            .shadow(radius: isDragging ? 5 : 0)
            .offset(x: piecePosition.x + dragOffset.width, y: piecePosition.y + dragOffset.height)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.isDragging = true
                        self.dragOffset = gesture.translation
                        
                    }
                    .onEnded { gesture in
                        self.isDragging = false
                    }
            )
            .animation(.easeInOut, value: isDragging)
            .animation(.easeInOut, value: dragOffset)
    }
}

#Preview {
    PieceView(piece: Piece(outline: PentominoOutline(name: "I", size: Size(width: 1, height: 5), outline: [Point(x: 0, y: 0), Point(x: 1, y: 0), Point(x: 1, y: 5), Point(x: 0, y: 5), Point(x: 0, y: 0)])))
        .environmentObject(PuzzleManager())
    
}
//PentominoOutline(name: "X", size: Size(width: 3, height: 3), outline: [Point(x: 1, y: 0), Point(x: 2, y: 0), Point(x: 2, y: 1), Point(x: 3, y: 1), Point(x: 3, y: 2), Point(x: 2, y: 2), Point(x: 2, y: 3), Point(x: 1, y: 3), Point(x: 1, y: 2), Point(x: 0, y: 2), Point(x: 0, y: 1), Point(x: 1, y: 1), Point(x: 1, y: 0)])
