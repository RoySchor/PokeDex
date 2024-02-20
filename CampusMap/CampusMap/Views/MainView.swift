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
            if !manager.selectedBuildings.isEmpty {
                selectedMarkers
            }
            
            centerCampusAnnotationsView
        }
        .onMapCameraChange{ context in
            manager.region = context.region
        }
        .safeAreaInset(edge: .top) {
            ZStack {
                Color.white
                MapTopControls()
            }
            .frame(height: 50)
            .padding()
            .shadow(radius: 20)

        }
    }
}

extension MainView {
    
    var selectedMarkers : some MapContent {
        ForEach(manager.buildings) { building in
            if building.isSelected {
                Annotation(building.name, coordinate: CLLocationCoordinate2D(latitude: building.latitude, longitude: building.longitude)) {
                    VStack {
                        Image(systemName: building.isFavorite ? "star.fill" : "mappin.circle")
                            .foregroundColor(building.isFavorite ? .yellow : .red)
                            .imageScale(.large)
                        Text(building.name)
                            .fixedSize()
                            .font(.caption)
                        //                            .hidden()
                    }
                }
                .annotationTitles(.visible)
            }
        }
                            
//        ForEach(manager.favorites) { favorite in
//            Marker(favorite.title, coordinate: .init(coord: favorite.coord))
//                .tint(.cyan)
//        }
    }
    
    var centerCampusAnnotationsView: some MapContent {
        ForEach(manager.buildings.filter { $0.name == "HUB Parking Deck" || $0.name == "Old Main" }) { building in
            Annotation(building.name, coordinate: CLLocationCoordinate2D(latitude: building.latitude, longitude: building.longitude)) {
                Text(building.name)
                    .hidden()
            }
            .annotationTitles(.hidden)
        }
    }

}


#Preview {
    MainView()
        .environmentObject(MapManager())
}
