//
//  ToggleRouteButton.swift
//  CampusMap
//
//  Created by Roy Schor on 2/27/24.
//

import SwiftUI

struct ToggleRouteButton: View {
    @EnvironmentObject var manager: MapManager
    
    var body: some View {
        Button(action: {
            manager.showRoute.toggle()
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
    ToggleRouteButton()
        .environmentObject(MapManager())
}
