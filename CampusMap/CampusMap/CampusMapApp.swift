//
//  CampusMapApp.swift
//  CampusMap
//
//  Created by Roy Schor on 2/19/24.
//

import SwiftUI

@main
struct CampusMapApp: App {
    @StateObject var manager = MapManager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(manager)
        }
    }
}
