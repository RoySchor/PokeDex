//
//  CampusMapViewUIKit.swift
//  CampusMap
//
//  Created by Roy Schor on 3/11/24.
//

import Foundation
import MapKit
import SwiftUI

struct CampusMapViewUIKit: UIViewRepresentable {
    @EnvironmentObject var manager: MapManager
    @Binding var mapType: MapType

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.region = manager.region
        mapView.showsUserLocation = true
        mapView.showsUserTrackingButton = true
        mapView.delegate = context.coordinator
        
        mapView.mapType = mapType.toMKMapType()
        
        updateAnnotations(on: mapView)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.mapType = mapType.toMKMapType()
        updateAnnotations(on: uiView)
    }
    
    func updateAnnotations(on mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        
        let selectedBuildings = manager.buildings.filter { $0.isSelected }
        
        // Add new annotations for selected buildings
        for building in selectedBuildings {
            let annotation = MKPointAnnotation()
            annotation.title = building.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: building.latitude, longitude: building.longitude)
            mapView.addAnnotation(annotation)
        }
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(manager: manager)
    }
}

#Preview {
    CampusMapViewUIKit(mapType: .constant(.standard))
        .environmentObject(MapManager())
}
