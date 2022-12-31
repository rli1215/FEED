//
//  ModelData.swift
//  FEED (iOS)
//
//  Created by Rachel Li on 10/4/22.
//

import Foundation
import Combine

final class RestaurantModelData: ObservableObject {
    @Published var restaurants: [RestaurantModel] = load("restaurantData.json")
    // don't need to mark it with @Published because you'll never modify hike data after initially loading it
    // var hikes: [Hike] = load("hikeData.json")
    
    var categories: [String: [RestaurantModel]] {
        Dictionary(
            grouping: restaurants,
            by: { $0.cuisine.rawValue }
        )
    }
}
