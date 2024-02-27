//
//  DirectionsView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/27/24.
//

import SwiftUI

struct DirectionsView: View {
    @EnvironmentObject var manager: MapManager
    @State private var showRouteView = false
    
    var body: some View {
        Button(action: {
            showRouteView.toggle()
        }) {
            VStack {
                Image(systemName: "mappin.circle")
                    .font(.system(size: 30))
                    .foregroundColor(.primary)
                
                Text("Routes")
                    .font(.headline)
                    .foregroundColor(.black)
            }
        }
        .sheet(isPresented: $showRouteView) {
            RouteSelectionView()
                .environmentObject(manager)
        }
    }
}

#Preview {
    DirectionsView()
        .environmentObject(MapManager())
}
