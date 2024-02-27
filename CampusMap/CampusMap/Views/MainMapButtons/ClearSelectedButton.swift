//
//  ClearSelectedButton.swift
//  CampusMap
//
//  Created by Roy Schor on 2/20/24.
//

import SwiftUI

struct ClearSelectedButton: View {
    @EnvironmentObject var manager: MapManager
    
    var body: some View {
        Button(action: {
            manager.deselectAllBuildings()
        }) {
            Text("Clear All")
                .font(.system(size: 17))
                .foregroundColor(.black)
                .bold()
        }
    }
}

#Preview {
    ClearSelectedButton()
        .environmentObject(MapManager())
}
