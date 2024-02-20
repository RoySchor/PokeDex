////
////  BuildingRow.swift
////  CampusMap
////
////  Created by Roy Schor on 2/19/24.
////
//
//import SwiftUI
//
//struct BuildingRow: View {
//    @EnvironmentObject var manager: MapManager
//    var building: Building
//    
//    var body: some View {
//        HStack {
//            Text(building.name)
//            Spacer()
//            if let isFavorite = building.isFavorite, isFavorite {
//                Image(systemName: "heart.fill").foregroundColor(.red)
//            }
//            if let isSelected = building.isSelected, isSelected {
//                Image(systemName: "checkmark")
//            }
//        }
//        .onTapGesture {
//            manager.toggleFavoriteStatus(for: building)
//        }
//    }
//}
//
////#Preview {
////    BuildingRow()
////        .environmentObject(MapManager())
////}
