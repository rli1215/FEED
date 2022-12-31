//
//  Restaurant.swift
//  FEED (iOS)
//
//  Created by Rachel Li on 10/4/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct RestaurantModel: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var globalRating: Float
    var street: String
    var city: String
    var state: String
    var zipcode: String
    var phone: String
    var website: String
    
    var cuisine: CuisineCategory
    enum CuisineCategory: String, CaseIterable, Codable {
        case mediterranean = "Mediterranean"
        case thai = "Thai"
        case chinese = "Chinese"
        case italian = "Italian"
    }

    var price: PriceCategory
    enum PriceCategory: String, CaseIterable, Codable {
        case one = "$"
        case two = "$$"
        case three = "$$$"
        case four = "$$$$"
    }

//    private var coordinates: Coordinates
//    var locationCoordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(
//            latitude: coordinates.latitude,
//            longitude: coordinates.longitude)
//    }
//
//    struct Coordinates: Hashable, Codable {
//        var latitude: Double
//        var longitude: Double
//    }
    
    static let defaultRestaurant = RestaurantModel(id:1001, name: "Bangkok Pinto", globalRating: 4.6,
                                          street: "1041 Tremont St",
                                          city: "Boston",
                                          state: "MA",
                                          zipcode: "02120",
                                          phone: "617-442-5555",
                                          website: "direct.chownow.com",
                                          cuisine: RestaurantModel.CuisineCategory.thai,
                                          price: RestaurantModel.PriceCategory.two)
    
    static let `default` = defaultRestaurant
}
