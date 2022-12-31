//
//  PostRow.swift
//  FEED
//
//  Created by Rachel Li on 12/23/22.
//

import Foundation
import SwiftUI

struct PostRow: View {
    var post: Post
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            HStack(alignment: .center) {
                Text(post.restaurant)
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                VStack {
                    StarsView(rating: post.rating)
                }
            }
            if (post.images.count > 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(post.images, id: \.self) { image in
                            PostImage(image: Image(image))
                        }
                    }
                }
                .frame(height: 185)
                .padding(.leading,-15)
            }
            Text(post.review)
        }
    }
}

struct PostRow_Previews: PreviewProvider {
    static var posts = UserModel.default.posts
    
    static var previews: some View {
        Group {
            PostRow(post: posts[0])
            PostRow(post: posts[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
