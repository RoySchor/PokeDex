//
//  MainView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/19/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let oldMain = CLLocationCoordinate2D(latitude: 40.798214, longitude: -77.859909)
    
    init(coord: Coord) {
        self = CLLocationCoordinate2D(latitude: coord.latitude, longitude: coord.longitude)
    }
    
}

struct MainView: View {
    @EnvironmentObject var manager : MapManager
    
    @State private var camera : MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $camera) {
        }
    }
}

#Preview {
    MainView()
        .environmentObject(MapManager())
}
