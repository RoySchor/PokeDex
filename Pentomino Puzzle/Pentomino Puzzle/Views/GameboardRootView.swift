//
//  GameboardRootView.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/3/24.
//

import SwiftUI

struct GameboardRootView: View {
    @EnvironmentObject var puzzleManager : PuzzleManager
    
    var body: some View {
        ZStack{
            HStack {
                VStack {
                    ForEach(puzzleManager.leftSideImages, id: \.self) { imageName in
                        PuzzleButtonView(puzzleButtonImage: imageName)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Reset")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    Spacer()
                        .frame(height:630)
                }
                
                GridView(rows: puzzleManager.gridViewSideSize, columns: puzzleManager.gridViewSideSize, blocksize: puzzleManager.gridViewBlockSize)
                    .offset(y:-290)
                    .overlay(
                        Group {
                            if let puzzleOutline = puzzleManager.currentPuzzle {
                                PuzzleView(puzzleOutline: puzzleOutline)
                                    .offset(y: -puzzleManager.calculateOffsetToCenterPuzzle() - 10)

                            }
                        }
                    )
                
                VStack {
                    ForEach(puzzleManager.rightSideImages, id: \.self) { imageName in
                        PuzzleButtonView(puzzleButtonImage: imageName)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Solve")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    Spacer()
                        .frame(height:630)
                }
            }
            
            ForEach(puzzleManager.pieces, id: \.outline.name) { piece in
                PentominoView(outline: piece.outline, color: Color(piece: piece))
                    .offset(x: puzzleManager.calculateOffsetX(for: piece), y: puzzleManager.calculateOffsetY(for: piece))
            }
            
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Gradient(colors: [.green, .yellow]).opacity(0.5))
    }
}

#Preview {
    GameboardRootView()
        .environmentObject(PuzzleManager())
}
