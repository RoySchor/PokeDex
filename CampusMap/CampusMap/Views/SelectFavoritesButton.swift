//
//  SelectFavoritesButton.swift
//  CampusMap
//
//  Created by Roy Schor on 2/20/24.
//

import SwiftUI

struct SelectFavoritesButton: View {
    @EnvironmentObject var manager : MapManager
    
    var body: some View {
        Button(action: {
            manager.toggleShowOnlyFavorites()
        }) {
            Image(systemName: manager.showOnlyFavorites ? "circle.fill" : "circle")
                .font(.body)
                .foregroundColor(.black)
            Text(manager.showOnlyFavorites ? "Show All" : "Show Favorites")
                .foregroundColor(.black)
        }
        .frame(width: 195, height: 25)
    }
    
    private func toggleSelectAllFavorites() {
        manager.toggleSelectAllFavorites()
    }
}

#Preview {
    SelectFavoritesButton()
        .environmentObject(MapManager())
}
