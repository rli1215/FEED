//
//  StarRatingView.swift
//  FEED (iOS)
//
//  Created by Rachel Li on 12/31/22.
// https://swdevnotes.com/swift/2022/create-a-star-rating-swiftui-component/

import SwiftUI
import Foundation

struct StarRatingView: View {
    @Binding var value: Double
    var stars: Int = 5
    
    @State var lastCoordinateValue: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { gr in
            let ratingWidth = gr.size.width * value / Double(stars)
            let starWidth = gr.size.width / Double(stars)
            let radius = starWidth * 0.01
            
            let maxValue = gr.size.width
            let scaleFactor = maxValue / Double(stars)
            
            ZStack {
                HStack(spacing:0) {
                    Rectangle()
                        .fill(.yellow)
                        .frame(width: ratingWidth)
                    Rectangle()
                        .fill(.clear)
                }
                
                HStack(spacing:0) {
                    ForEach(1...stars, id:\.self) { _ in
                        StarShape(points: 5, cutout: true)
                            .fill(Color.gray, style: FillStyle(eoFill: true, antialiased: true))
                            .frame(width: starWidth, height: gr.size.height, alignment: .center)
                    }
                }
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { v in
                            if (abs(v.translation.width) < 0.1) {
                                self.lastCoordinateValue = v.location.x
                            }
                            if v.translation.width > 0 {
                                let nextCoordinateValue = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                self.value = (nextCoordinateValue / scaleFactor)
                            } else {
                                let nextCoordinateValue = max(0.0, self.lastCoordinateValue + v.translation.width)
                                self.value = (nextCoordinateValue / scaleFactor)
                            }
                        }
                )
            }
        }
    }
}
struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(value:.constant(5))
    }
}

