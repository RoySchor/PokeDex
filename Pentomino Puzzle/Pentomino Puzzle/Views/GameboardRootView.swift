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
                        puzzleManager.resetCurrentPuzzle()
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
                        withAnimation {
//                            puzzleManager.solveCurrentPuzzle()
                        }
                    } label: {
                        Text("Solve")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                            .opacity(puzzleManager.currentPuzzle == nil ? 0.5 : 1.0)
                    }
                    .disabled(puzzleManager.currentPuzzle == nil)
                    Spacer()
                        .frame(height:630)
                }
            }
            
            PiecesGridView()
               .offset(y: 305)
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Gradient(colors: [.green, .yellow]).opacity(0.5))
    }
}

#Preview {
    GameboardRootView()
        .environmentObject(PuzzleManager())
}
