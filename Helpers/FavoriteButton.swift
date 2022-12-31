//
//  FavoriteButton.swift
//  FEED
//
//  Created by Rachel Li on 12/30/22.
//

import Foundation
import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var index: Int = -1
    @Binding var curIndex: Int
    
    var config = UIImage.SymbolConfiguration(
        pointSize: 32, weight: .medium, scale: .default)
    
    var body: some View {
        Button() {
            isSet.toggle()
            curIndex = index
        } label: {
            Image(systemName: isSet ? "star.square.on.square.fill" : "star.square.on.square")
                .resizable()
                .scaledToFit()
                .frame(width:30, height:30)
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .white)
        }
        .onChange(of: curIndex) {newValue in
            if (newValue != index) {
                isSet = false
            }
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true), curIndex: .constant(0))
    }
}
