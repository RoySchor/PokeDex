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
    
    init(manager: MapManager) {
        self.manager = manager
    }
    
   func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       let clusterID = "Cluster"
       switch annotation {
       case is MKClusterAnnotation:
           let cluster = annotation as! MKClusterAnnotation
           let clusterView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: clusterID)
           clusterView.markerTintColor = .blue
           clusterView.glyphText = "\(cluster.memberAnnotations.count)"
           return clusterView
       default:
           return nil
           
       }
       
    }
    
    func mapView(_ mapView: MKMapView, clusterAnnotationForMemberAnnotations memberAnnotations: [MKAnnotation]) -> MKClusterAnnotation {
        return MKClusterAnnotation(memberAnnotations: memberAnnotations)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {

    }
    
    // Called when Map needs to display an overlay on the map
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

        switch overlay {
        case is MKPolyline:
            let polyLineRenderer = MKPolylineRenderer(overlay: overlay)
            polyLineRenderer.strokeColor = UIColor.red
            polyLineRenderer.lineWidth = 4.0
            return polyLineRenderer
        default:
            assert(false, "Unhandled Overlay")
        }

    }
    
    
//    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
//        if let selectedPlace = annotation as? Place {
//            self.manager.selectedPlace = selectedPlace
//        }
//    }
    
}

