//
//  RouteSelectionView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/27/24.
//

import SwiftUI

struct RouteSelectionView: View {
    @EnvironmentObject var manager: MapManager
    @Environment(\.dismiss) var dismiss
    
    @State var selectedStartingPoint: String = ""
    @State var selectedDestination: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Starting Point")) {
                    Picker("Starting Point", selection: $selectedStartingPoint) {
                        ForEach(manager.filterBuildings()) { building in
                            Text(building.name)
                        }
                    }
                }
                
                Section(header: Text("End Point")) {
                    Picker("Destination", selection: $selectedDestination) {
                        ForEach(manager.filterBuildings()) { building in
                            Text(building.name)
                        }
                    }
                }
                
                Section(header: CenteredHeaderView(selectedStartingPoint: $selectedStartingPoint, selectedDestination: $selectedDestination)) {
                    
                }
                
            }
            .navigationBarTitle("Directions", displayMode: .inline)
            .navigationBarItems(
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
    
    private struct CenteredHeaderView: View {
        @Binding var selectedStartingPoint: String
        @Binding var selectedDestination: String
        
        var body: some View {
            HStack {
                Spacer()
                ToggleRouteButton(selectedStartingPoint: $selectedStartingPoint, selectedDestination: $selectedDestination)
                Spacer()
            }
        }
    }
}

#Preview {
    RouteSelectionView()
        .environmentObject(MapManager())
}
