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
            saveBuildings()
        }
    }
    
    func toggleFavoriteStatus(for building: Building) {
        if let index = buildings.firstIndex(where: { $0.id == building.id }) {
            buildings[index].isFavorite.toggle()
            saveBuildings()
        }
    }
    
    private func saveBuildings() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(buildings)
            UserDefaults.standard.set(data, forKey: "buildingsData")
        } catch {
            print("Failed to encode buildings data: \(error)")
        }
    }
    
    private func loadBuildings() {
        if let data = UserDefaults.standard.data(forKey: "buildingsData") {
            do {
                let decoder = JSONDecoder()
                buildings = try decoder.decode([Building].self, from: data)
            } catch {
                print("Error decoding buildings data: \(error)")
                loadBuildingsFromBundle()
            }
        } else {
            loadBuildingsFromBundle()
        }
    }
    
    private func loadBuildingsFromBundle() {
        guard let url = Bundle.main.url(forResource: "buildings", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Buildings data not found in bundle")
            return
        }

        let decoder = JSONDecoder()
        if let decodedData = try? decoder.decode([Building].self, from: data) {
            self.buildings = decodedData
        } else {
            print("Error decoding buildings data from bundle")
        }
    }
    
//    private func loadBuildings() {
//        guard let url = Bundle.main.url(forResource: "buildings", withExtension: "json"),
//              let data = try? Data(contentsOf: url) else {
//            print("Buildings data not found")
//            return
//        }
//
//        let decoder = JSONDecoder()
//        if let decodedData = try? decoder.decode([Building].self, from: data) {
//            self.buildings = decodedData
//        } else {
//            print("Error decoding buildings data")
//        }
//    }
}
