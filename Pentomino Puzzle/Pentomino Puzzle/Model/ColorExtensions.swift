//
//  ColorExtensions.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/5/24.
//

import Foundation
import SwiftUI

extension Color {
    init(piece: Piece) {
        switch piece.outline.name {
        case "F":
            self = .red
        case "I":
            self = .blue
        case "L":
            self = .green
        case "N":
            self = .orange
        case "P":
            self = .yellow
        case "T":
            self = .purple
        case "U":
            self = .pink
        case "V":
            self = .teal
        case "W":
            self = .gray
        case "X":
            self = .indigo
        case "Y":
            self = .brown
        case "Z":
            self = .mint
        default:
            self = .black
        }
    }
}
