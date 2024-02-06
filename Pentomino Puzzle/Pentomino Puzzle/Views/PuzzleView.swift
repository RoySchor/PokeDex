//
//  PuzzleView.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/5/24.
//

import SwiftUI

struct PuzzleView: View {
    @EnvironmentObject var puzzleManager: PuzzleManager
    var puzzleOutline: PuzzleOutline
    var color: Color = .gray
    
    var body: some View {
        PuzzleShape(puzzleOutline: puzzleOutline)
            .fill(color.opacity(0.8), style: FillStyle(eoFill: true))
            .frame(width: CGFloat(CGFloat(puzzleOutline.size.width) * puzzleManager.gridViewBlockSize), height: CGFloat(CGFloat(puzzleOutline.size.height) * puzzleManager.gridViewBlockSize))
    }
}

#Preview {
    PuzzleView(puzzleOutline: PuzzleOutline(
        name: "6x10",
        size: Size(width: 10, height: 6),
        outlines: [
            [
                Point(x: 0, y: 0), Point(x: 10, y: 0), Point(x: 10, y: 6), Point(x: 0, y: 6), Point(x: 0, y: 0)
            ]]))
        .environmentObject(PuzzleManager())
}
