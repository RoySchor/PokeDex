//
//  PuzzleButtonView.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/5/24.
//

import SwiftUI

struct PuzzleButtonView: View {
    var puzzleButtonImage: String
    
    var body: some View {
        Button(action: {
            
        }) {
            Image(puzzleButtonImage)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding()
        }
    }
}

#Preview {
    PuzzleButtonView(puzzleButtonImage: "Board0")
}
