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
                        puzzleManager.doItNow()
                    } label: {
                        Text("Reset")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    Spacer()
                        .frame(height:630)
                }
                
                GridView(rows: puzzleManager.gridViewSideSize, columns: puzzleManager.gridViewSideSize, blocksize: puzzleManager.gridViewBlockSize)
                    .offset(y:-310)
                
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
            
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Gradient(colors: [.green, .yellow]).opacity(0.5))
    }
}

#Preview {
    GameboardRootView()
        .environmentObject(PuzzleManager())
}
