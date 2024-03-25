//
//  StatComponentView.swift
//  Pokedex
//
//  Created by Roy Schor on 3/18/24.
//

import SwiftUI

struct StatComponentView: View {
    var label: String
    var value: String
    
    var body: some View {
        VStack {
            Text(label)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.primary)
                .bold()
            HStack(spacing: 10) {
                Text(value)
                    .font(.system(size: 35, weight: .heavy))
                    .foregroundColor(.primary)
                Text(unit)
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(.primary)
            }
        }
        .padding()
    }
    
    private var unit: String {
        switch label.lowercased() {
        case "height":
            return "m"
        case "weight":
            return "kg"
        default:
            return ""
        }
    }
}

#Preview {
    StatComponentView(label: "Height", value: String(Pokemon.standard.height))
}
