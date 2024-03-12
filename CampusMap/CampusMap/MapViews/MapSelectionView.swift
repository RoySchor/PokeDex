//
//  MapSelectionView.swift
//  CampusMap
//
//  Created by Roy Schor on 3/11/24.
//

import SwiftUI
import MapKit

struct MapSelectionView: View {
    @EnvironmentObject var manager : MapManager
    @Binding var interactionMode : MapInteractionModes
    @Binding var selectedBuilding : Building?
    @Binding var selectedMapType: MapType
    @State private var selectedStepIndex = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            CampusMapViewUIKit(mapType: $selectedMapType, onAnnotationTapped: { building in
                self.selectedBuilding = building})
                .sheet(item: $selectedBuilding) { selectedBuilding in
                    BuildingDetailView(buildingId: selectedBuilding.id)
                        .environmentObject(manager)
                        .presentationDetents([.fraction(0.3)])
                }
                .alert("User's Location", isPresented: $manager.showAlert, actions: {}) {
                    Text(manager.userLocationDescription ?? "No Location Found")
                }
                .safeAreaInset(edge: .top) {
                    ZStack {
                        Color.white
                        MapTopControls()
                    }
                    .frame(height: 120)
                    .padding()
                    .shadow(radius: 20)
                }
            
            if manager.showRoute, let route = manager.route {
                RouteStepView(steps: route.steps, selectedStepIndex: $selectedStepIndex)
                    .transition(.move(edge: .bottom))
                    .animation(.default, value: selectedStepIndex)
            }
        }
    }
}

#Preview {
    MapSelectionView(interactionMode: .constant(.all), selectedBuilding: .constant(Building.standard), selectedMapType: .constant(.standard))
        .environmentObject(MapManager())
}
