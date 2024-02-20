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
    @State private var areAllFavoritesSelected = false
    
    @State private var searchText = ""
    
    var filteredBuildings: [Building] {
        if searchText.isEmpty {
            return manager.buildings
        } else {
            return manager.buildings.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
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
//                ForEach(filteredBuildings.sorted(by: { $0.name < $1.name })) { building in
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
//            .searchable(text: $searchText, prompt: "Search Buildings")
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
//            .navigationTitle("Buildings")
        }
    }
}

#Preview {
    BuildingListView()
        .environmentObject(MapManager())
}
