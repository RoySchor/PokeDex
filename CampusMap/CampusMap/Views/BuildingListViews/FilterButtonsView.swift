//
//  FilterButtonsView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/26/24.
//

import SwiftUI

struct FilterButtonsView: View {
    @EnvironmentObject var manager: MapManager
    
    var body: some View {
        HStack(spacing: 30) {
            ForEach(MapManager.BuildingFilter.allCases, id: \.self) { filter in
                Button(action: {
                    manager.buildingFilter = filter
                }) {
                    VStack {
                        Image(systemName: manager.buildingFilter == filter ? "circle.fill" : "circle")
                            .font(.largeTitle)
                            .foregroundColor(manager.buildingFilter == filter ? .gray : .gray)

                        Text(filter.rawValue)
                            .font(.caption)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                }
            }
        }
    }
}

#Preview {
    FilterButtonsView()
        .environmentObject(MapManager())
}
