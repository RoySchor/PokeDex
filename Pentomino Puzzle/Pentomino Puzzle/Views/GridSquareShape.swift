//
//  GridSquareShape.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/5/24.
//

import SwiftUI

struct GridSquareShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRect(rect)
        return path
    }
}

#Preview {
    GridSquareShape()
}
