//
//  RouteStepView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/27/24.
//

import SwiftUI
import MapKit

struct RouteStepView: View {
    var steps: [MKRoute.Step]
    @Binding var selectedStepIndex: Int
    
    var body: some View {
        TabView(selection: $selectedStepIndex) {
            ForEach(steps.indices, id: \.self) { index in
                Text(steps[index].instructions)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .frame(height: 150)
        .padding(.bottom, 20)
    }
}

//#Preview {
//    RouteStepView()
//}
