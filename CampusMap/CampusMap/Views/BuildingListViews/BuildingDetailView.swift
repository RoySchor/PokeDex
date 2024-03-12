//
//  BuildingDetailView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/20/24.
//

import SwiftUI

struct BuildingDetailView: View {
    @EnvironmentObject var manager: MapManager
    @State private var selectedStepIndex = 0
    var buildingId: String
    
    var body: some View {
        let building = manager.building(withId: buildingId)
        
        VStack(spacing: 3) {
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
                HStack {
                    Text("Favorite")
                        .foregroundColor(.black)
                    
                    Image(systemName: building.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(building.isFavorite ? .red : .gray)
                }
            }
            Spacer()
                .frame(height: 10)
            
            Button(action: {
                manager.toggleBuildingSelection(building: building)
            }) {
                HStack {
                    Text(building.isSelected ? "Deselect Building" : "Select Building")
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                    
                    Image(systemName: building.isSelected ? "checkmark.square" : "square")
                        .foregroundColor(.black)
                }
            }
            Spacer()
                .frame(height: 10)
            
            Button(action: {
                manager.setStartPoint(buildingName: "Current Location")
                manager.setEndPoint(buildingName: building.name)
                manager.calculateRoute()
                manager.showRoute = true
            }) {
                HStack {
                    Text("Get Directions")
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                    
                    Image(systemName: "figure.walk.circle")
                        .foregroundColor(.black)
                        .font(.system(size: 23))
                }
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BuildingDetailView(buildingId: "Brumbaugh Hall")
        .environmentObject(MapManager())
}
