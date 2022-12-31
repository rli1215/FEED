//
//  ProfileImage.swift
//  FEED
//
//  Created by Rachel Li on 12/22/22.
//

import Foundation
import SwiftUI

struct ProfileImage: View {
    var image: Image = Image(systemName: "person.fill")
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .frame(height:80)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(image: Image("turtlerock"))
    }
}
