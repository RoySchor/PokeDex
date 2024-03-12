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
        VStack {
            HStack(spacing: 9) {
                BuildingSearchButton()
                    .environmentObject(manager)
                Spacer()
                    .frame(width: 10)
                
                DirectionsView()
                    .environmentObject(manager)
                Spacer()
                    .frame(width: 10)
                
                ClearSelectedButton()
                    .environmentObject(manager)
                Spacer()
                    .frame(width: 10)
            }
            Spacer()
                .frame(height: 15)
            
            HStack (spacing: 9) {
                ClearCurrentRouteButton()
                    .environmentObject(manager)
                Spacer()
                    .frame(width: 10)
                
                ClearCustomBuildingsButton()
                    .environmentObject(manager)
            }
            
        }
    }
}

#Preview {
    MapTopControls()
        .environmentObject(MapManager())
}
