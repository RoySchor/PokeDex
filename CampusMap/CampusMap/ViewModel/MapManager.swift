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
    @Published var camera : MapCameraPosition = .region(MKCoordinateRegion(center: .oldMain, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    
    @Published var region = MKCoordinateRegion(center: .oldMain, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @Published var buildings: [Building] = []
    
    init() {
        loadBuildings()
    }
    
    func toggleBuildingSelection(building: Building) {
        if let index = buildings.firstIndex(where: { $0.id == building.id }) {
            buildings[index].isSelected.toggle()
        }
    }
    
    func toggleFavoriteStatus(for building: Building) {
        if let index = buildings.firstIndex(where: { $0.id == building.id }) {
            buildings[index].isFavorite.toggle()
        }
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
