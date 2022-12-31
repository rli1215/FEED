//
//  EatListView.swift
//  FEED
//
//  Created by Rachel Li on 12/22/22.
//

import Foundation
import SwiftUI

struct EatListView: View {
    @EnvironmentObject var restaurantModelData: RestaurantModelData
    var restaurants: [RestaurantModel]
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Eat List")
                .bold()
                .font(.headline)
                .padding(.leading,20)
            List() {
                ForEach(restaurants) { restaurant in
                    EatListRow(restaurant: restaurant)
                }
            }
            .listStyle(.inset)
        }
    }
}

struct EatListView_Previews: PreviewProvider {
    static var previews: some View {
        EatListView(restaurants: [RestaurantModel.default])
            .environmentObject(RestaurantModelData())
    }
}
