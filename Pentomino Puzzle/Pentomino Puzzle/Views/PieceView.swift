//
//  PieceView.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/6/24.
//

import SwiftUI

struct PieceView: View {
    @EnvironmentObject var puzzleManager: PuzzleManager
    @State private var offset = CGSize.zero
    @State private var isDragging: Bool = false
    
    @Binding var piece: Piece
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged{ (value) in
                self.isDragging = true
                offset = value.translation
            }
            .onEnded { (value) in
                withAnimation {
                    self.isDragging = false

                    let newOffset = puzzleManager.offset(for: piece, from: value.translation)
                    piece.moveBy(positionOffset: newOffset)
                    self.offset = CGSize.zero
                }
            }
        
        let tapGesture = TapGesture()
            .onEnded { _ in
//                if !isDragging {
                    withAnimation {
                        piece.rotate90DegreesClockwise()
                    }
//                }
            }
        
        let longPressGesture = LongPressGesture()
            .onEnded { _ in
//                if !isDragging {
                    withAnimation {
                        piece.flipVertically()
//                    }
                }
            }
                
        PentominoView(outline: piece.outline, color: Color(piece: piece))
//            .opacity(piece.isCorrect ? 0.5 : 1.0)
            .scaleEffect(isDragging ? 1.2 : 1.0)
            .shadow(radius: isDragging ? 5 : 0)
            .position(puzzleManager.positionFor(piece))
            .offset(offset)
            .gesture(tapGesture)
            .gesture(longPressGesture)
            .gesture(dragGesture)
            .rotation3DEffect(.degrees(piece.position.orientation.rotationAngle), axis: (x: 0, y: 0, z: 1))
            .rotation3DEffect(.degrees(piece.position.orientation.isMirrored ? 180 : 0), axis: (x: 0, y: 1, z: 0))
//            .rotation3DEffect(.degrees(Double(piece.position.orientation.z) * 90), axis: (x: 0, y: 0, z: 1))
//            .rotation3DEffect(.degrees(Double(piece.position.orientation.y) * 180), axis: (x: 0, y: 1, z: 0))
    }
}

//#Preview {
//    PieceView(piece: Piece(outline: PentominoOutline(name: "I", size: Size(width: 1, height: 5), outline: [Point(x: 0, y: 0), Point(x: 1, y: 0), Point(x: 1, y: 5), Point(x: 0, y: 5), Point(x: 0, y: 0)])))
//        .environmentObject(PuzzleManager())
//    
//}
//PentominoOutline(name: "X", size: Size(width: 3, height: 3), outline: [Point(x: 1, y: 0), Point(x: 2, y: 0), Point(x: 2, y: 1), Point(x: 3, y: 1), Point(x: 3, y: 2), Point(x: 2, y: 2), Point(x: 2, y: 3), Point(x: 1, y: 3), Point(x: 1, y: 2), Point(x: 0, y: 2), Point(x: 0, y: 1), Point(x: 1, y: 1), Point(x: 1, y: 0)])
