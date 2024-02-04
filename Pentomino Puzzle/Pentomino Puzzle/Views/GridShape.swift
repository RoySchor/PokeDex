//
//  GridShape.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/3/24.
//

import SwiftUI

struct GridShape: Shape {
    var rows: Int
    var columns: Int
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Cell size
        let rowWidth = rect.height / CGFloat(rows)
        let columnHeight = rect.width / CGFloat(columns)
        
        // Horizontal lines
        for row in 0...rows {
            let y = CGFloat(row) * rowWidth
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: rect.width, y: y))
        }
        
        // Vertical lines
        for column in 0...columns {
            let x = CGFloat(column) * columnHeight
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: rect.height))
        }
        
        return path
    }
    
}

#Preview {
    GridShape(rows: 60, columns: 40)
        .stroke(lineWidth: 2)
        .frame(width: 60, height: 40)
}
