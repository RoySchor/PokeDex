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
    @Published var gridViewBlockSize: CGFloat = CGFloat(40)
    @Published var lineWidth: CGFloat = CGFloat(2)
    @Published var currentPuzzle: PuzzleOutline?
    
    var pieces: [Piece] = []
    var puzzles: [PuzzleOutline] = []
    let puzzleNameMap = [
            "Board0": nil,
            "Board1": "6x10",
            "Board2": "5x12",
            "Board3": "OneHole",
            "Board4": "FourNotches",
            "Board5": "FourHoles",
            "Board6": "13Holes",
            "Board7": "Flower"
        ]
    
    init() {
        loadPentominoes()
        loadPuzzles()
    }
    
    func getPuzzleOutline(for imageName: String) -> PuzzleOutline? {
        guard let puzzleName = puzzleNameMap[imageName] else {
            print("No puzzle associated with \(imageName)")
            return nil
        }
        return puzzles.first { $0.name == puzzleName }
    }
    
    func calculateOffsetToCenterPuzzle() -> CGFloat {
        let totalGridHeight = CGFloat(gridViewSideSize) * gridViewBlockSize
        return totalGridHeight / 2
    }
    
    func resetCurrentPuzzle() {
        currentPuzzle = nil
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
