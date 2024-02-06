//
//  GridView.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/5/24.
//

import SwiftUI

struct GridView: View {
    let rows: Int
    let columns: Int
    let blocksize: CGFloat

    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<rows, id: \.self) { _ in
                HStack(spacing: 0) {
                    ForEach(0..<columns, id: \.self) { _ in
                        GridSquareShape()
                            .stroke(lineWidth: 2)
                            .frame(width: blocksize, height: blocksize)
                    }
                }
            }
        }
    }
}

#Preview {
    GridView(rows: 14, columns: 14, blocksize: 40)
}
