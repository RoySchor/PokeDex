//
//  MapManager.swift
//  CampusMap
//
//  Created by Roy Schor on 2/19/24.
//

import Foundation
import MapKit
import SwiftUI

class MapManager : NSObject, ObservableObject {
    @Published var camera : MapCameraPosition = .region(MKCoordinateRegion(center: .oldMain, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    @Published var region = MKCoordinateRegion(center: .oldMain, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    let locationManager : CLLocationManager
    
    @Published var userLocationDescription : String?
    @Published var showAlert : Bool = false
    
    @Published var userLocation: CLLocation? {
        didSet {
            if centerOnUserLocation {
                centerMapOnUserLocation()
            }
        }
    }
    @Published var centerOnUserLocation: Bool = false
    
    enum BuildingFilter: String, CaseIterable {
        case all = "All"
        case favorites = "Favorites"
        case selected = "Selected"
        case nearby = "Nearby"
    }
    
    @Published var buildings: [Building] = []
    @Published var showOnlyFavorites: Bool = false
    @Published var buildingFilter: BuildingFilter = .all
    @Published var filteredBuildings: [Building] = []
    
    @Published var route: MKRoute?
    @Published var sourceLocation: CLLocationCoordinate2D?
    @Published var sourceLocationBuilding: Building?
    @Published var destinationLocation: CLLocationCoordinate2D?
    @Published var destinationLocationBuilding: Building?
    @Published var currentRoute: MKRoute?
    
    @Published var showRoute: Bool = false
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        loadBuildings()
        loadPersistedBuildings()
    }
    
    func toggleBuildingSelection(building: Building) {
        if let index = buildings.firstIndex(where: { $0.id == building.id }) {
            buildings[index].isSelected.toggle()
            savePersistedBuildings()
        }
    }
    
    func toggleFavoriteStatus(for id: String) {
        if let index = buildings.firstIndex(where: { $0.id == id }) {
            buildings[index].isFavorite.toggle()
            savePersistedBuildings()
        }
        objectWillChange.send()
    }
    
    func building(withId id: String) -> Building {
        return buildings.first(where: { $0.id == id })!
    }
    
    func deselectAllBuildings() {
        buildings.indices.forEach { index in
            buildings[index].isSelected = false
        }
        savePersistedBuildings()
    }
    
    func nearbyBuildings(threshold: CLLocationDistance = 500) -> [Building] {
        guard let userLocation = userLocation else { return [] }
        
        return buildings.filter { building in
            let buildingLocation = CLLocation(latitude: building.latitude, longitude: building.longitude)
            return buildingLocation.distance(from: userLocation) <= threshold
        }
    }
    
    func filterBuildings() -> [Building] {
        let filteredBuildings: [Building]
        
        switch buildingFilter {
        case .all:
            filteredBuildings = buildings
        case .favorites:
            filteredBuildings = buildings.filter { $0.isFavorite }
        case .selected:
            filteredBuildings = buildings.filter { $0.isSelected }
        case .nearby:
            filteredBuildings = nearbyBuildings()
        }
        
        return filteredBuildings.sorted { $0.name < $1.name }
    }
    
    func buildingByName(_ name: String) -> Building? {
        return buildings.first { $0.name == name }
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
    
    private func loadPersistedBuildings() {
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let persistedFileURL = documentDirectory.appendingPathComponent("persistedBuildings.json")

        guard let data = try? Data(contentsOf: persistedFileURL) else { return }

        let decoder = JSONDecoder()
        if let persistedBuildings = try? decoder.decode(PersistedBuildings.self, from: data) {

            self.buildings = self.buildings.map { building in
                var modifiedBuilding = building
                if persistedBuildings.favorites.contains(building.id) {
                    modifiedBuilding.isFavorite = true
                }
                if persistedBuildings.selected.contains(building.id) {
                    modifiedBuilding.isSelected = true
                }
                return modifiedBuilding
            }
        }
    }
    
    private func savePersistedBuildings() {
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let persistedFileURL = documentDirectory.appendingPathComponent("persistedBuildings.json")

        let favorites = buildings.filter { $0.isFavorite }.map { $0.id }
        let selected = buildings.filter { $0.isSelected }.map { $0.id }
        let persistedBuildings = PersistedBuildings(favorites: favorites, selected: selected)

        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(persistedBuildings) {
            try? encodedData.write(to: persistedFileURL)
        }
    }
}

