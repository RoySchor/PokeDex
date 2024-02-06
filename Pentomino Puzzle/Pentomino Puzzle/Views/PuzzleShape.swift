//
//  PuzzleShape.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/3/24.
//

import SwiftUI

struct PuzzleShape: Shape {
    var puzzleOutline: PuzzleOutline
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let rowHeight = rect.height / CGFloat(puzzleOutline.size.height)
        let columnWidth = rect.width / CGFloat(puzzleOutline.size.width)

        for outline in puzzleOutline.outlines {
            var outlinePath = Path()

            
            if let firstPoint = outline.first {
                let start = CGPoint(x: CGFloat(firstPoint.x) * columnWidth, y: CGFloat(firstPoint.y) * rowHeight)
                outlinePath.move(to: start)
            }
            
            for point in outline.dropFirst() {
                let x = CGFloat(point.x) * columnWidth
                let y = CGFloat(point.y) * rowHeight
                outlinePath.addLine(to: CGPoint(x: x, y: y))
            }
            
            path.addPath(outlinePath)
        }

        return path
    }
}

#Preview {
    PuzzleShape(puzzleOutline: PuzzleOutline(
        name: "6x10",
        size: Size(width: 10, height: 6),
        outlines: [
            [
                Point(x: 0, y: 0), Point(x: 10, y: 0), Point(x: 10, y: 6), Point(x: 0, y: 6), Point(x: 0, y: 0)
            ]]))
    .stroke(lineWidth: 2)
    .frame(width: 200, height: 120)
    
}
