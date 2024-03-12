//
//  RouteStepView.swift
//  CampusMap
//
//  Created by Roy Schor on 2/27/24.
//

import SwiftUI
import MapKit

struct RouteStepView: View {
    @ObservedObject var viewModel: RouteStepViewModel
    @Binding var selectedStepIndex: Int
    
    var body: some View {
        TabView(selection: $selectedStepIndex) {
            ForEach(viewModel.steps.indices, id: \.self) { index in
                VStack {
                    Text(viewModel.steps[index].instructions)
                        .padding()
                    
                    Text("Travel Time: \(viewModel.formattedTravelTime(for: viewModel.steps[index]))")
                        .padding()
                        .foregroundColor(.secondary)
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 10)
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
