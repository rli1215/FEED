//
//  PointOfInterest.swift
//  FEED
//
//  Created by Rachel Li on 12/26/22.
// Source: https://www.createwithswift.com/using-mapkit-with-swiftui/

import Foundation
import MapKit

struct PointOfInterest: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
