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
    
    var body: some View {
        NavigationView {
            List {
                Section(header: FilterButtonsView(manager: _manager)) {
                    ForEach(manager.buildings.filter { building in
                        return manager.showOnlyFavorites ? building.isFavorite : true
                    }
                    .sorted(by: { $0.name < $1.name })) { building in
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
                    SelectFavoritesButton()
                        .environmentObject(manager)
                    ClearSelectedButton()
                        .environmentObject(manager)
                },
                trailing: HStack {
                    Button("Done") {
                        dismiss()
                    }
                }
            )
        }
    }
}

#Preview {
    BuildingListView()
        .environmentObject(MapManager())
}
