//
//  ClearCustomBuildingsButton.swift
//  CampusMap
//
//  Created by Roy Schor on 3/11/24.
//

import SwiftUI

struct ClearCustomBuildingsButton: View {
    @EnvironmentObject var manager: MapManager
    
    var body: some View {
        Button(action: {
            manager.removeAllCustomMarkers()
            manager.clearRoute()
        }) {
            Text("Clear Custom Pins")
                .font(.system(size: 17))
                .foregroundColor(.black)
                .bold()
        }
    }
}

#Preview {
    ClearCustomBuildingsButton()
        .environmentObject(MapManager())
}
