//
//  RouteSelectionView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/27/24.
//

import SwiftUI

struct RouteSelectionView: View {
    @EnvironmentObject var manager: MapManager
    
    @State private var selectedStartingPoint: String = "Current Location"
    @State private var selectedDestination: String = "Current Location"
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Starting Point")) {
                    Picker("Starting Point", selection: $selectedStartingPoint) {
                        ForEach(manager.filterBuildings()) { building in
                            Text(building.name)
                        }
                    }
                }
                
                Section(header: Text("End Point")) {
                    Picker("Destination", selection: $selectedDestination) {
                        ForEach(manager.filterBuildings()) { building in
                            Text(building.name)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RouteSelectionView()
        .environmentObject(MapManager())
}
