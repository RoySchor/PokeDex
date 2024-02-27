//
//  MainCampusMapView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/26/24.
//

import SwiftUI
import MapKit

struct MainCampusMapView: View {
    @EnvironmentObject var manager : MapManager
    @State private var camera : MapCameraPosition = .automatic
    @Binding var interactionMode : MapInteractionModes
    @Binding var selectedBuilding : Building?
    
    var body: some View {
        MapReader { proxy in
            Map(position: $camera, interactionModes: interactionMode) {
                selectedMarkerAnnotations
                centerCampusAnnotationsView
                
                if manager.showRoute {
                    if let route = manager.routes.first {
                        ForEach(route.steps, id:\.self) { step in
                            MapPolyline(step.polyline)
                                .stroke(.black, lineWidth: 5.0)
                        }
                    }
                }
            }
            .mapControls {
                MapUserLocationButton()
                    .mapControlVisibility(.visible)
            }
            .controlSize(.large)
            .onMapCameraChange{ context in
                manager.region = context.region
            }
        }
        .safeAreaInset(edge: .top) {
            ZStack {
                Color.white
                MapTopControls()
            }
            .frame(height: 60)
            .padding()
            .shadow(radius: 20)
            
        }
    }
}

extension MainCampusMapView {
    
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
    MainCampusMapView(interactionMode: .constant(.all), selectedBuilding: .constant(Building.standard))
        .environmentObject(MapManager())
}
