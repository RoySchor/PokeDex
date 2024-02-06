//
//  PentominoShape.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/3/24.
//

import SwiftUI

struct PentominoShape: Shape {
    var outline: PentominoOutline

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowHeight = rect.height / CGFloat(outline.size.height)
        let columnWidth = rect.width / CGFloat(outline.size.width)
        
        if let firstPoint = outline.outline.first {
            path.move(to: CGPoint(x: CGFloat(firstPoint.x) * columnWidth, y: CGFloat(firstPoint.y) * rowHeight))
        }
        
        for point in outline.outline.dropFirst() {
            let x = CGFloat(point.x) * columnWidth
            let y = CGFloat(point.y) * rowHeight
            
            path.addLine(to: CGPoint(x: x, y: y))
        }

        return path
    }
}

#Preview {
    PentominoShape(outline: PentominoOutline(name: "I", size: Size(width: 1, height: 5), outline: [Point(x: 0, y: 0), Point(x: 1, y: 0), Point(x: 1, y: 5), Point(x: 0, y: 5), Point(x: 0, y: 0)]))
        .stroke(lineWidth: 2)
        .frame(width: 100, height: 500)
}
//PentominoOutline(name: "X", size: Size(width: 3, height: 3), outline: [Point(x: 1, y: 0), Point(x: 2, y: 0), Point(x: 2, y: 1), Point(x: 3, y: 1), Point(x: 3, y: 2), Point(x: 2, y: 2), Point(x: 2, y: 3), Point(x: 1, y: 3), Point(x: 1, y: 2), Point(x: 0, y: 2), Point(x: 0, y: 1), Point(x: 1, y: 1), Point(x: 1, y: 0)])
