//
//  Favorite.swift
//  CampusMap
//
//  Created by Roy Schor on 2/19/24.
//

import Foundation

struct Coord {
    var latitude : Double
    var longitude : Double
}

struct Favorite : Identifiable {
    
    let coord : Coord
    let name : String
    let subtitle : String?
    var id = UUID()
    
    init(coord:Coord, name:String, subtitle:String? = nil) {
        self.coord = coord
        self.name = name
        self.subtitle = subtitle
    }
   

}
