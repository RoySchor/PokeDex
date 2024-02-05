//
//  PuzzleManager.swift
//  Pentomino Puzzle
//
//  Created by Roy Schor on 2/3/24.
//

import Foundation

class PuzzleManager: ObservableObject {
    @Published var leftSideImages: [String] = (0...3).map { "Board\($0)" }
    @Published var rightSideImages: [String] = (4...7).map { "Board\($0)" }
    @Published var gridViewSideSize: Int = 14
    @Published var gridViewBlockSize: CGFloat = CGFloat(30)
    
    var pieces: [Piece] = []
    var puzzles: [PuzzleOutline] = []
    
    init() {
        loadPentominoes()
        loadPuzzles()
    }
    
    private func loadPentominoes() {
        guard let url = Bundle.main.url(forResource: "PentominoOutlines", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("PentominoOutlines.json file not found")
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let outlines = try decoder.decode([PentominoOutline].self, from: data)
            self.pieces = outlines.map { Piece(position: Position(), outline: $0) }
        } catch {
            print("Error decoding PentominoOutlines: \(error)")
        }
    }
    
    private func loadPuzzles() {
        guard let url = Bundle.main.url(forResource: "PuzzleOutlines", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("PuzzleOutlines.json file not found")
            return
        }
        
        do {
            let decoder = JSONDecoder()
            self.puzzles = try decoder.decode([PuzzleOutline].self, from: data)
        } catch {
            print("Error decoding PuzzleOutlines: \(error)")
        }
    }
}
