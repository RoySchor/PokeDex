//
//  MapViewCoordinator.swift
//  CampusMap
//
//  Created by Roy Schor on 3/11/24.
//

import Foundation
import MapKit


class MapViewCoordinator : NSObject, MKMapViewDelegate {
    let manager : MapManager
    var onAnnotationTapped: (Building) -> Void
    
    init(manager: MapManager, onAnnotationTapped: @escaping (Building) -> Void) {
        self.manager = manager
        self.onAnnotationTapped = onAnnotationTapped
    }
    
   func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       let clusterID = "Cluster"
       if annotation is MKClusterAnnotation {
           let cluster = annotation as! MKClusterAnnotation
           let clusterView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: clusterID)
           clusterView.markerTintColor = .blue
           clusterView.glyphText = "\(cluster.memberAnnotations.count)"
           return clusterView
       }
       
       return nil
    }
    
    func mapView(_ mapView: MKMapView, clusterAnnotationForMemberAnnotations memberAnnotations: [MKAnnotation]) -> MKClusterAnnotation {
        return MKClusterAnnotation(memberAnnotations: memberAnnotations)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {

    }
    
    // Called when Map needs to display an overlay on the map
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.red
            polylineRenderer.lineWidth = 4.0
            return polylineRenderer
        }
        return MKOverlayRenderer()
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotationTitle = view.annotation?.title as? String,
           let building = manager.buildings.first(where: { $0.name == annotationTitle }) {
            onAnnotationTapped(building)
        }
    }
    
    @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state != .began { return }
        
        let point = gesture.location(in: gesture.view as? MKMapView)
        guard let mapView = gesture.view as? MKMapView else { return }
        
        let coordinate = mapView.convert(point, toCoordinateFrom: mapView)

        let customBuilding = Building(latitude: coordinate.latitude, longitude: coordinate.longitude, name: "Custom Marker", customMarker: true)
        DispatchQueue.main.async {
            self.manager.buildings.append(customBuilding)
            self.manager.objectWillChange.send()
        }
    }
}

