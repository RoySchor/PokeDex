//
//  PentominoView.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/3/24.
//

import SwiftUI

struct PentominoView: View {
    @EnvironmentObject var puzzleManager : PuzzleManager
    var outline: PentominoOutline
    var color: Color
    
    var body: some View {
        ZStack{
            PentominoShape(outline: outline)
                .stroke(lineWidth: puzzleManager.lineWidth)
                .frame(width: 100, height: 100)
            
            PentominoShape(outline: outline)
                .fill(color)
                .frame(width: 100, height: 100)
            
            GridView(rows: outline.size.height, columns: outline.size.width, blocksize: 100 / CGFloat(outline.size.width))
                .clipShape(PentominoShape(outline: outline))
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    PentominoView(outline: PentominoOutline(
        name: "X",
        size: Size(width: 3, height: 3),
        outline: [Point(x: 1, y: 0), Point(x: 2, y: 0), Point(x: 2, y: 1), Point(x: 3, y: 1), Point(x: 3, y: 2), Point(x: 2, y: 2), Point(x: 2, y: 3), Point(x: 1, y: 3), Point(x: 1, y: 2), Point(x: 0, y: 2), Point(x: 0, y: 1), Point(x: 1, y: 1), Point(x: 1, y: 0)]),
          color: .blue)
    .environmentObject(PuzzleManager())
}
