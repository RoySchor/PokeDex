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
    
    var body: some View {
        CampusMapViewUIKit(mapType: $selectedMapType)
            .ignoresSafeArea()
    }
}

#Preview {
    MapSelectionView(interactionMode: .constant(.all), selectedBuilding: .constant(Building.standard), selectedMapType: .constant(.standard))
        .environmentObject(MapManager())
}
