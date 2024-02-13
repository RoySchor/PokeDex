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
    
    @Published var pieces: [Piece] = []
    @Published var puzzles: [PuzzleOutline] = []
    @Published var solutions: [String: [String: Position]] = [:]
    
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
        loadSolutions()
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
        for index in pieces.indices {
            // Reset the position to the origin (0,0)
            pieces[index].position.x = 0
            pieces[index].position.y = 0
            
            // Reset the orientation to default
            pieces[index].position.orientation.x = 0
            pieces[index].position.orientation.y = 0
            pieces[index].position.orientation.z = 0
        }
        currentPuzzle = nil
    }
    
    func offset(for piece:Piece, from size:CGSize) -> Position {
        let position = offset(for: size)
        return position
    }
    
    func positionFor(_ piece: Piece) -> CGPoint {
        let x = (CGFloat(piece.position.x) + 2.3) * CGFloat(gridViewBlockSize)
        let y = (CGFloat(piece.position.y) + 1.9) * CGFloat(gridViewBlockSize)
        return CGPoint(x: x, y: y)
    }
    
//    func solveCurrentPuzzle() {
//        guard let puzzleName = currentPuzzle?.name else { return }
//        
//        guard let puzzleSolution = solutions[puzzleName] else { return
//        }
//        
////        guard let solutionPositions = solutions[puzzleName] else { return }
//        
////        for index in pieces.indices {
////            let pieceName = pieces[index].outline.name
////            if let solutionPosition = puzzleSolution[pieceName] {
////                pieces[index].position = solutionPosition
////                pieces[index].isCorrect = true
////            }
////        }
//        
//        for index in pieces.indices {
//            let pieceName = pieces[index].outline.name
//            if let solutionPosition = puzzleSolution[pieceName] {
//                pieces[index].to(Position(x: solutionPosition.x, y: solutionPosition.y, orientation: orientationFromString(solutionPosition.orientation)))
//            }
//        }
//    }
    
    func updatePiecesCorrectness() {
        guard let puzzleName = currentPuzzle?.name else { return }
        guard let solutionPositions = solutions[puzzleName] else { return }
        
        for index in pieces.indices {
            let piece = pieces[index]
            if let solutionPosition = solutionPositions[piece.outline.name], piece.position == solutionPosition {
                pieces[index].isCorrect = true
            } else {
                pieces[index].isCorrect = false
            }
        }
    }
    
    private func orientationFromString(_ orientation: String) -> Orientation3D {
        // Assuming default orientation is 'up' with no rotation or flip.
        var x = 0, y = 0, z = 0
        
        switch orientation {
        case "up":
            z = 0
        case "right":
            z = 1
        case "down":
            z = 2
        case "left":
            z = 3
        case "upMirrored":
            z = 0; y = 1
        case "rightMirrored":
            z = 1; y = 1
        case "downMirrored":
            z = 2; y = 1
        case "leftMirrored":
            z = 3; y = 1
        default:
            break
        }
        
        return Orientation3D(x: x, y: y, z: z)
    }
    
    private func offset( for size:CGSize) -> Position {
        let newX = Int(round(size.width/gridViewBlockSize))
        let newY = Int(round(size.height/gridViewBlockSize))
        
        return Position(x: newX, y: newY)
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
    
    private func loadSolutions() {
        guard let url = Bundle.main.url(forResource: "Solutions", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Solutions.json file not found")
            return
        }
            
        do {
            let decoder = JSONDecoder()
            self.solutions = try decoder.decode([String: [String: Position]].self, from: data)
        } catch {
            print("Error decoding Solutions: \(error)")
        }
    }
}
