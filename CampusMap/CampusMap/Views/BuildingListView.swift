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
    @State private var areAllFavoritesSelected = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Buildings")) {
                }
                .font(.title)
                .bold()
                .frame(height: 5)
                .foregroundColor(.gray)
                
                ForEach(manager.buildings.sorted(by: { $0.name < $1.name })) { building in
                    HStack {
                        Image(systemName: building.isSelected ? "checkmark.square" : "square")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                manager.toggleBuildingSelection(building: building)
                            }
                        Text(building.name)
                        Spacer()
                        if building.isFavorite {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        }
                    }
                    .onTapGesture {
                        manager.toggleBuildingSelection(building: building)
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
