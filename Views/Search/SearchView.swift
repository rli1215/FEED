//
//  DiscoveryPage.swift
//  FEED (iOS)
//
//  Created by Rachel Li on 10/5/22.
//

import SwiftUI
import CoreLocation
import MapKit

struct SearchView: View {
    @EnvironmentObject var modelData: RestaurantModelData
    @StateObject var manager = LocationManager()
    @State var tracking:MapUserTrackingMode = .follow
    
    private let places = [
            PointOfInterest(name: "Bangkok Pinto",
                            latitude: -71.085837,
                            longitude: 42.336648),
            PointOfInterest(name: "MIDA",
                            latitude: -71.080524,
                            longitude: 42.339111)]
        
    
    var body: some View {
        GeometryReader { metrics in
            VStack(spacing: 0) {
                Map(coordinateRegion: $manager.region,
                    interactionModes: MapInteractionModes.all,
                    showsUserLocation: true,
                    userTrackingMode: $tracking,
                    annotationItems: places) {
                    place in MapAnnotation(coordinate: place.coordinate) {
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
                .ignoresSafeArea(edges: .top)
                .frame(height: metrics.size.height)
            }
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(RestaurantModelData())
    }
}
