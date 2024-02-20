//
//  BuildingDetailView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/20/24.
//

import SwiftUI

struct BuildingDetailView: View {
    var building: Building
    var toggleFavorite: (Building) -> Void
    
    var body: some View {
        VStack {
            if let imageName = building.photo, !imageName.isEmpty, UIImage(named: imageName) != nil {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
            }
            Text(building.name)
                .font(.title)
            Spacer()
                .frame(height: 10)
            
            if let year = building.year_constructed {
                Text("Constructed in \(String(year))")
                    .font(.subheadline)
            }
            Spacer()
                .frame(height: 10)
            
            Button(action: {
                toggleFavorite(building)
            }) {
                Image(systemName: building.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(building.isFavorite ? .red : .gray)
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    @EnvironmentObject var manager: MapManager
//    BuildingDetailView(building: Building.standardBuilding, toggleFavorite: manager.toggleFavoriteStatus)
//}