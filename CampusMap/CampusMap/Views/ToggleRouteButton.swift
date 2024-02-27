//
//  ToggleRouteButton.swift
//  CampusMap
//
//  Created by Roy Schor on 2/27/24.
//

import SwiftUI

struct ToggleRouteButton: View {
    @EnvironmentObject var manager: MapManager
    @Binding var selectedStartingPoint: String
    @Binding var selectedDestination: String
    
    var body: some View {
        Button(action: {
            manager.showRoute.toggle()
            if manager.showRoute {
                manager.setStartPoint(buildingName: selectedStartingPoint)
                manager.setEndPoint(buildingName: selectedDestination)
            }
            else {
                manager.clearRoute()
            }
        }) {
            VStack {
                Image(systemName: manager.showRoute ? "checkmark.square" : "square")
                    .font(.title)
                    .foregroundColor(.black)
                
                Text("Show Route")
                    .font(.headline)
                    .foregroundColor(.black)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ToggleRouteButton(selectedStartingPoint: .constant(""), selectedDestination: .constant(""))
        .environmentObject(MapManager())
}
