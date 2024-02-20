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
        Button(action: toggleSelectAllFavorites) {
            Image(systemName: manager.allFavoritesSelected ? "circle" : "circle.fill")
                .font(.body)
                .foregroundColor(.black)
            Text(manager.allFavoritesSelected ? "Deselect Favorites" : "Select Favorites")
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
