////
////  BuildingRowView.swift
////  CampusMap
////
////  Created by Roy Schor on 2/19/24.
////
//
//import SwiftUI
//
//struct BuildingRow: View {
//    @Binding var building: Building
//
//    var body: some View {
//        List(buildings) { building in
//            HStack {
//                Text(building.name)
//                Spacer()
//                if building.isFavorite {
//                    Image(systemName: "heart.fill").foregroundColor(.red)
//                }
//                Button(action: {
//                    if let index = buildings.firstIndex(where: { $0.id == building.id }) {
//                        buildings[index].isSelected.toggle()
//                    }
//                }) {
//                    Image(systemName: building.isSelected ? "checkmark.square.fill" : "square")
//                }
//                //            Image(systemName: building.isSelected ? "checkmark.square.fill" : "square")
//                //                .onTapGesture {
//                //                    building.isSelected.toggle()
//                //                }
//            }
//        }
//    }
//}
//
////#Preview {
////    BuildingRowView()
////}
