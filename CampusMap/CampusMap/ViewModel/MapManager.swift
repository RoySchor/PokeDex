//
//  MapManager.swift
//  CampusMap
//
//  Created by Roy Schor on 2/19/24.
//

import Foundation
import MapKit
import SwiftUI

class MapManager : ObservableObject {
    @Published var places = [Place]()
    
    @Published var camera : MapCameraPosition = .region(MKCoordinateRegion(center: .oldMain, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    
    @Published var region = MKCoordinateRegion(center: .oldMain, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    @Published var buildings: [Building] = []

    init() {
        loadBuildings()
    }
    
    func clearAll() {
        places.removeAll()
    }
    
    private func loadBuildings() {
        guard let url = Bundle.main.url(forResource: "buildings", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Buildings data not found")
            return
        }

        let decoder = JSONDecoder()
        if let decodedData = try? decoder.decode([Building].self, from: data) {
            self.buildings = decodedData
        } else {
            print("Error decoding buildings data")
        }
    }
}
