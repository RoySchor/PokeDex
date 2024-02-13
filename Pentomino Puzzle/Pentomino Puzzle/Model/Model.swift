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
    var orientation: Orientation3D = Orientation3D(x: 0, y: 0, z: 0)
    
    static func +(lhs: Position, rhs: Position) -> Position {
        Position(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
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
        position.orientation.rotate90DegreesClockwise()

        if position.orientation.z % 2 != 0 {
            let temp = outline.size.width
            outline.size.width = outline.size.height
            outline.size.height = temp
        }
    }
    
    mutating func flipVertically() {
        position.orientation.flipVertically()
    }
}

struct Orientation3D: Decodable, Equatable {
    var x: Int
    var y: Int
    var z: Int
}

extension Orientation3D {
    mutating func rotate90DegreesClockwise() {
        z = (z + 1) % 4 // Add 1 to Z and mod by 4 to keep it within 0-3
    }
    
    mutating func flipVertically() {
        y = (y + 1) % 2 // Toggle between 0 and 1
    }
}
