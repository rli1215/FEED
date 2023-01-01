//
//  RatingView.swift
//  FEED (iOS)
//
//  Created by Rachel Li on 1/1/23.
// Source: https://azamsharp.medium.com/building-a-rating-view-in-swiftui-c76468d2be6

import SwiftUI

struct RatingView: View {
    @Binding var rating: Float
    var max: Int = 5
    
    var body: some View {
        HStack(alignment:.center, spacing:20) {
            ForEach(1..<(max + 1), id: \.self) { index in
                Image(systemName: self.starType(index: index))
                    .resizable()
                    .scaledToFit()
                    .frame(width:30, height:30)
                    .foregroundColor(Color.yellow)
                    .onTapGesture {
                        if (Int(self.rating.rounded(.up)) == index ) {
                            if (rating.truncatingRemainder(dividingBy: 1) == 0 ){
                                self.rating = self.rating - 0.5
                            }
                            else {
                                self.rating = Float(index)
                            }
                        } else {
                            self.rating = Float(index) - 0.5
                        }
                    }
            }
            Text(String(rating))
                .font(.title2)
                .padding([.leading], 15)
        }
    }
    
    private func starType(index: Int) -> String {
        let rating = self.rating;
        if (index == Int(rating.rounded(.up))) {
            if (rating.truncatingRemainder(dividingBy: 1) == 0 ){
                return "star.fill"
            }
            else {
                return "star.leadinghalf.filled"
            }
        }
        else if (index <= Int(rating.rounded(.down))) {
            return "star.fill"
        } else {
            return "star"
        }
        
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating:.constant(3.5))
    }
}
