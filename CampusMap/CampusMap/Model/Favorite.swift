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
    let title : String
    let subtitle : String?
    var id = UUID()
    
    init(coord:Coord, title:String, subtitle:String? = nil) {
        self.coord = coord
        self.title = title
        self.subtitle = subtitle
    }
   

}
