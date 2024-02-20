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
        HStack(spacing:20) {
            BuildingSearchButton()
                .environmentObject(manager)
        }
    }
}

#Preview {
    MapTopControls()
        .environmentObject(MapManager())
}
