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
    var onAnnotationTapped: (Building) -> Void

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        mapView.region = manager.region
        mapView.showsUserLocation = true
        mapView.showsUserTrackingButton = true
        mapView.mapType = mapType.toMKMapType()
        mapView.delegate = context.coordinator
        
        updateAnnotations(on: mapView)
        updateRouteAnnotations(on: mapView)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.mapType = mapType.toMKMapType()
        updateAnnotations(on: uiView)
        updateRouteAnnotations(on: uiView)
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
    
    func updateRouteAnnotations(on mapView: MKMapView) {
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations.filter { $0.title == "Current Location" || $0.title == manager.sourceLocationBuilding?.name || $0.title == manager.destinationLocationBuilding?.name })
        
        addRouteAnnotationForBuilding(mapView, building: manager.sourceLocationBuilding, asSource: true)
        addRouteAnnotationForBuilding(mapView, building: manager.destinationLocationBuilding, asSource: false)
        
        if let route = manager.route {
            let polyline = route.polyline
            mapView.addOverlay(polyline)
        }
    }

    func addRouteAnnotationForBuilding(_ mapView: MKMapView, building: Building?, asSource: Bool) {
        guard let building = building else { return }
        let annotation = MKPointAnnotation()
        annotation.title = building.name
        annotation.coordinate = CLLocationCoordinate2D(latitude: building.latitude, longitude: building.longitude)
        mapView.addAnnotation(annotation)
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(manager: manager, onAnnotationTapped: onAnnotationTapped)
    }
}

//#Preview {
//    CampusMapViewUIKit(mapType: .constant(.standard))
//        .environmentObject(MapManager())
//}
