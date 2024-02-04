//
//  PentominoView.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/3/24.
//

import SwiftUI

struct PentominoView: View {
    var outline: PentominoOutline
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let scaleX = geometry.size.width / CGFloat(outline.size.width)
                let scaleY = geometry.size.height / CGFloat(outline.size.height)
                
                if let firstPoint = outline.outline.first {
                    path.move(to: CGPoint(x: CGFloat(firstPoint.x) * scaleX, y: CGFloat(firstPoint.y) * scaleY))
                }
                
                for point in outline.outline.dropFirst() {
                    path.addLine(to: CGPoint(x: CGFloat(point.x) * scaleX, y: CGFloat(point.y) * scaleY))
                }
            }
            .fill(color)
            .overlay(
                Path { path in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    let blockWidth = width / CGFloat(outline.size.width)
                    let blockHeight = height / CGFloat(outline.size.height)
                    
                    // Drawing grid lines
                    for x in stride(from: 0, to: width, by: blockWidth) {
                        path.move(to: CGPoint(x: x, y: 0))
                        path.addLine(to: CGPoint(x: x, y: height))
                    }
                    
                    for y in stride(from: 0, to: height, by: blockHeight) {
                        path.move(to: CGPoint(x: 0, y: y))
                        path.addLine(to: CGPoint(x: width, y: y))
                    }
                }
            )
//            ).stroke(Color.black, lineWidth: 1)
        }
    }
}

#Preview {
    PentominoView(outline: PentominoOutline(name: "X", size: Size(width: 100, height: 100), outline: [Point(x: 15, y: 15)]), color: .yellow)
}
