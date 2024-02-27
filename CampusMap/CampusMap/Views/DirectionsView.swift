//
//  DirectionsView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/27/24.
//

import SwiftUI

struct DirectionsView: View {
    @EnvironmentObject var manager: MapManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            RouteSelectionView()
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
}

#Preview {
    DirectionsView()
        .environmentObject(MapManager())
}
