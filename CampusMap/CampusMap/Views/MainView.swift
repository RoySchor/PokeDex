//
//  MainView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/19/24.
//

import SwiftUI
import MapKit

struct MainView: View {
    @EnvironmentObject var manager : MapManager
    @State var interactionMode : MapInteractionModes = .all
    @State var selectedBuilding : Building?
    
    var body: some View {
        
        MainCampusMapView(interactionMode: $interactionMode, selectedBuilding: $selectedBuilding)
            .sheet(item: $selectedBuilding) { selectedBuilding in
                BuildingDetailView(buildingId: selectedBuilding.id)
                    .environmentObject(manager)
                    .presentationDetents([.fraction(0.3)])
            }
            .alert("User's Location", isPresented: $manager.showAlert, actions: {}) {
                Text(manager.userLocationDescription ?? "No Location Found")
            }
    }
}

#Preview {
    MainView()
        .environmentObject(MapManager())
}
