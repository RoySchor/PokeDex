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
    
    @State var selectedBuilding : Building?
    
    var body: some View {
        Map(position: $camera) {
            selectedMarkerAnnotations
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
        .sheet(item: $selectedBuilding) { selectedBuilding in
            BuildingDetailView(buildingId: selectedBuilding.id)
                .environmentObject(manager)
                .presentationDetents([.fraction(0.3)])
        }
    }
}

extension MainView {
    
    var selectedMarkers : some MapContent {
        ForEach(manager.buildings.filter { $0.isSelected }) { building in
                if building.isSelected {
                    Marker(building.name, coordinate: .init(coord: Coord(latitude: building.latitude, longitude: building.longitude)))
                        .tint(building.isFavorite ? .cyan : .red)
                }
        }
    }
    
    var selectedMarkerAnnotations : some MapContent {
        ForEach(manager.buildings.filter { $0.isSelected }) { building in
            if building.isSelected {
                Annotation(building.name, coordinate: .init(coord: Coord(latitude: building.latitude, longitude: building.longitude))) {
                            
                    Button {
                        selectedBuilding = building
                    } label: {
                        Image(systemName: "mappin")
                            .font(.system(size: 40))
                            .foregroundStyle(building.isFavorite ? .cyan : .red)
                    }
                    
                }
            }
        }
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
