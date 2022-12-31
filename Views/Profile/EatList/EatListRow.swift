//
//  EatListRow.swift
//  FEED
//
//  Created by Rachel Li on 12/23/22.
//

import Foundation
import SwiftUI

struct EatListRow: View {
    var restaurant: RestaurantModel
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            HStack(alignment: .top) {
                VStack(alignment:.leading, spacing: 10){
                    Text(restaurant.name)
                        .font(.title2)
                        .bold()
                    
                    Text("\(restaurant.city), \(restaurant.state)")
                    
                }
                
                Spacer()
                
                VStack(alignment:.trailing, spacing: 10) {
                    Text("avg. rating")
                    HStack(alignment:.center) {
                        Text(String(restaurant.globalRating))
                        Image(systemName: "star.fill").foregroundColor(Color.yellow)
                    }
                }
            }
        }
    }
}

struct EatListRow_Previews: PreviewProvider {
    static var restaurants = [RestaurantModel.default]
    
    static var previews: some View {
        Group {
            EatListRow(restaurant: restaurants[0])
            EatListRow(restaurant: restaurants[0])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
