////
////  MapManager+Search.swift
////  CampusMap
////
////  Created by Roy Schor on 2/19/24.
////
//
//import Foundation
//import MapKit
//
//extension MapManager {
//    
//    func searchFor(_ building: Building) {
//        // perform the search
//        let request = MKLocalSearch.Request()
//        request.region = region
//        request.naturalLanguageQuery = building.name
//        let search = MKLocalSearch(request: request)
//        search.start { response, error in
//            self.selectedBuildings.removeAll()
//            
//            guard let response = response else {
//                if let error = error {
//                    print(error.localizedDescription)
//                }
//                return
//            }
//            
//            let maptItems = response.mapItems
//            for item in maptItems {
//                let building = Building(mapItem: item, category: category, customName: nil)
//                self.selectedBuildings.append(place)
//                
//            }
//            
//        }
//        
//    }
//}
