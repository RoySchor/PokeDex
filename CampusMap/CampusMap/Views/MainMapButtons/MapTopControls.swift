//
//  MapTopControls.swift
//  CampusMap
//
//  Created by Roy Schor on 2/19/24.
//

import SwiftUI

struct MapTopControls: View {
    @EnvironmentObject var manager : MapManager
    
    var body: some View {
        HStack(spacing: 7) {
            BuildingSearchButton()
                .environmentObject(manager)
            Spacer()
                .frame(width: 8)
            
            DirectionsView()
                .environmentObject(manager)
            Spacer()
                .frame(width: 8)
            
            ClearSelectedButton()
                .environmentObject(manager)
            Spacer()
                .frame(width: 8)
            
            ClearCustomBuildingsButton()
                .environmentObject(manager)
        }
    }
}

#Preview {
    MapTopControls()
        .environmentObject(MapManager())
}
