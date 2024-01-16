//
//  ContentView.swift
//  spelling_bee_game
//
//  Created by Roy Schor on 1/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(Constants.BackgroundColorName.bkColor)
                .ignoresSafeArea()
            
            VStack {
                Text("Solving The Spelling Bee")
                    .foregroundColor(.black)
                    .bold()
                    .font(.title)
                    .frame(width: 500, height: 100)
                Spacer()
            }
        }
    }
}


#Preview {
    ContentView()
}
