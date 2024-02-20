//
//  BuildingDetailView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/20/24.
//

import SwiftUI

struct BuildingDetailView: View {
    @EnvironmentObject var manager: MapManager
    var buildingId: String
    
    var body: some View {
        let building = manager.building(withId: buildingId)
        
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
                manager.toggleFavoriteStatus(for: buildingId)
            }) {
                Image(systemName: building.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(building.isFavorite ? .red : .gray)
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}
