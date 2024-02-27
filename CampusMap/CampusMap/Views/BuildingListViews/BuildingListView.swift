//
//  BuildingListView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/19/24.
//

import SwiftUI

struct BuildingListView: View {
    @EnvironmentObject var manager: MapManager
    @Environment(\.dismiss) var dismiss
    
    var filteredBuildings: [Building] {
        switch manager.buildingFilter {
        case .all:
            return manager.buildings
        case .favorites:
            return manager.buildings.filter { $0.isFavorite }
        case .selected:
            return manager.buildings.filter { $0.isSelected }
        case .nearby:
            return manager.nearbyBuildings()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: FilterButtonsView(manager: _manager)) {
                    ForEach(manager.filterBuildings()) { building in
                        Button(action: {
                            manager.toggleBuildingSelection(building: building)
                        }) {
                            HStack {
                                Image(systemName: building.isSelected ? "checkmark.square" : "square")
                                    .foregroundColor(.blue)
                                
                                Text(building.name)
                                    .frame(width: 300, alignment: .leading)
                                Spacer()
                                
                                if building.isFavorite {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationBarItems(
                leading: HStack {
                    ClearSelectedButton()
                        .environmentObject(manager)
                },
                trailing: HStack {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(.black)
                    .bold()
                }
            )
        }
    }
}

#Preview {
    BuildingListView()
        .environmentObject(MapManager())
}
