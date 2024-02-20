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
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
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
            .navigationBarItems(trailing: Button("Done") {
                dismiss()
            })
            .navigationTitle("Buildings")
        }
    }
}

#Preview {
    BuildingListView()
        .environmentObject(MapManager())
}
