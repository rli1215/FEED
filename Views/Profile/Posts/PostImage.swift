//
//  PostImage.swift
//  FEED
//
//  Created by Rachel Li on 12/24/22.
//

import Foundation
import SwiftUI

struct PostImage: View {
    var image: Image

    var body: some View {
        VStack(alignment: .leading) {
            image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
        }
        .padding(.leading, 15)
    }
}

struct PostImage_Previews: PreviewProvider {
    static var previews: some View {
        PostImage(image:Image("mcd1"))
    }
}
