//
//  RouteStepViewModel.swift
//  CampusMap
//
//  Created by Roy Schor on 3/12/24.
//

import Foundation
import MapKit

class RouteStepViewModel: ObservableObject {
    var steps: [MKRoute.Step]

    init(steps: [MKRoute.Step]) {
        self.steps = steps
    }

    func formattedTravelTime(for step: MKRoute.Step) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .short
        return formatter.string(from: step.distance) ?? ""
    }
}
