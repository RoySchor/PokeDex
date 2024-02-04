//
//  PuzzleShape.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/3/24.
//

import SwiftUI

struct PuzzleShape: Shape {
    var outline: PuzzleOutline
    
    func path(in rect: CGRect) -> Path {
        var combinedPath = Path()

        let scaleX = rect.width / CGFloat(outline.size.width)
        let scaleY = rect.height / CGFloat(outline.size.height)

        // Iterate through each outline in the puzzle outline
        for singleOutline in outline.outlines {
            var path = Path()

            if let firstPoint = singleOutline.first {
                path.move(to: CGPoint(x: CGFloat(firstPoint.x) * scaleX, y: CGFloat(firstPoint.y) * scaleY))
            }

            // Add lines to the rest of the points in the outline, scaling each
            for point in singleOutline.dropFirst() {
                path.addLine(to: CGPoint(x: CGFloat(point.x) * scaleX, y: CGFloat(point.y) * scaleY))
            }
            
            combinedPath.addPath(path)
        }
        return combinedPath
    }
}

#Preview {
    PuzzleShape(outline: PuzzleOutline(name: "X", size: Size(width: 6, height: 10), outlines: [[Point(x: 15, y: 15)]]))
    
}
