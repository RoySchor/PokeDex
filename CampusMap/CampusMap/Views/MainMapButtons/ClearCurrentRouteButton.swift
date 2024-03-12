//
//  ClearCurrentRouteButton.swift
//  CampusMap
//
//  Created by Roy Schor on 3/11/24.
//

import SwiftUI

struct ClearCurrentRouteButton: View {
    @EnvironmentObject var manager: MapManager
    
    var body: some View {
        Button(action: {
            manager.clearRoute()
        }) {
            Text("Clear Route")
                .font(.system(size: 17))
                .foregroundColor(.black)
                .bold()
        }
    }
}

#Preview {
    ClearCurrentRouteButton()
        .environmentObject(MapManager())
}
