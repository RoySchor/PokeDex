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
    PentominoShape(outline: PentominoOutline(name: "X", size: Size(width: 100, height: 100), outline: [Point(x: 15, y: 15)]))
        .stroke(lineWidth: 2)
        .frame(width: 100, height: 100)
        .border(Color.black)
}
