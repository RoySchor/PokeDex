//
//  Pentominoes.swift
//  Assets for Assignment 4
//
//  Created by Alfares, Nader on 1/28/23.
//
import Foundation


//Mark:- Shapes models
struct Point: Decodable {
    let x : Int
    let y : Int
}

struct Size: Decodable {
    var width : Int
    var height : Int
}

typealias Outline = [Point]

struct PentominoOutline: Decodable {
    let name : String
    var size : Size
    let outline : Outline
}

struct PuzzleOutline: Decodable {
    let name : String
    let size : Size
    let outlines : [Outline]
}

//Mark:- Pieces Model

// specifies the complete position of a piece using unit coordinates
struct Position: Decodable  {
    var x : Int = 0
    var y : Int = 0
//    var orientation: Orientation3D = Orientation3D(x: 0, y: 0, z: 0)
    var orientation: Orientation = .up
    
    static func +(lhs: Position, rhs: Position) -> Position {
        Position(x: lhs.x + rhs.x, y: lhs.y + rhs.y, orientation: lhs.orientation)
    }
}

extension Position: Equatable {
    static func ==(lhs: Position, rhs: Position) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.orientation == rhs.orientation
    }
}

// a Piece is the model data that the view uses to display a pentomino
struct Piece  {
    var position : Position = Position()
    var outline : PentominoOutline
    var isCorrect: Bool = false
    
}

extension Piece {
    
    mutating func moveBy(positionOffset: Position) {
        position = position + positionOffset
    }
    
    mutating func to(_ position: Position) {
        self.position = position
    }
    
    mutating func rotate90DegreesClockwise() {
        switch position.orientation {
        case .up:
            position.orientation = .right
        case .right:
            position.orientation = .down
        case .down:
            position.orientation = .left
        case .left:
            position.orientation = .up
        case .upMirrored:
            position.orientation = .leftMirrored
        case .rightMirrored:
            position.orientation = .upMirrored
        case .downMirrored:
            position.orientation = .rightMirrored
        case .leftMirrored:
            position.orientation = .downMirrored
        }
    }
        
        //    mutating func rotate90DegreesClockwise() {
        //        position.orientation.rotate90DegreesClockwise()
        //
        //        if position.orientation.z % 2 != 0 {
        //            let temp = outline.size.width
        //            outline.size.width = outline.size.height
        //            outline.size.height = temp
        //        }
        //    }
        
    mutating func flipVertically() {
//        switch position.orientation {
//        case .up, .down, .upMirrored, .downMirrored:
//            position.y = 180 // Signify a flip for non-mirrored orientations
//        default:
//            position.y = 0 // For mirrored orientations, resetting y
//        }
        
        switch position.orientation {
        case .up:
            position.orientation = .upMirrored
        case .down:
            position.orientation = .downMirrored
        case .upMirrored:
            position.orientation = .up
        case .downMirrored:
            position.orientation = .down
        case .left:
            position.orientation = .leftMirrored
        case .right:
            position.orientation = .rightMirrored
        case .leftMirrored:
            position.orientation = .left
        case .rightMirrored:
            position.orientation = .right
        }
    }
        
        //    mutating func flipVertically() {
        //        position.orientation.flipVertically()
        //    }
        //}
    }

//struct Orientation3D: Decodable, Equatable {
//    var x: Int
//    var y: Int
//    var z: Int
//}

//extension Orientation3D {
//    mutating func rotate90DegreesClockwise() {
//        z = (z + 1) % 4 // Add 1 to Z and mod by 4 to keep it within 0-3
//    }
//    
//    mutating func flipVertically() {
//        y = (y + 1) % 2 // Toggle between 0 and 1
//    }
//}

extension Orientation {
    var rotationAngle: Double {
        switch self {
        case .up:
            return 0
        case .right:
            return 90
        case .down:
            return 180
        case .left:
            return 270
        case .upMirrored, .downMirrored, .leftMirrored, .rightMirrored:
            return 0
        }
    }
    
    var isMirrored: Bool {
        switch self {
        case .upMirrored, .downMirrored, .leftMirrored, .rightMirrored:
            return true
        default:
            return false
        }
    }
}
