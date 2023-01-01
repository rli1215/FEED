//
//  CreatePostView.swift
//  FEED
//
//  Created by Rachel Li on 12/30/22.
//

import SwiftUI

struct CreatePostView: View {
    @State private var isShowPhotoLibrary = false
    @State var selectedImages: [PostPhoto]
    @State private var reviews = [String](repeating:"", count:12)
    @State private var overallReview: String = ""
    @State private var ratings = [Float](repeating:0, count:12)
    
    var body: some View {
        HStack(alignment: .center, spacing:30) {
            ForEach(Array(selectedImages.enumerated()), id:\.element) { index, img in
                VStack(alignment:.leading, spacing: 20) {
                    Image(uiImage:img.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width:300, height: 300, alignment: .center)
                        .clipped()
                        .cornerRadius(5)
                    
                    RatingView(rating: $ratings[index])
                    
                    if (img.isCoverPhoto) {
                        MultiTextField(value:$overallReview, placeholder: "Overall Review")
                    }
                    else {
                        MultiTextField(value:$reviews[index], placeholder: "Review")
                    }
                }
            }
        }.modifier(ScrollingHStackModifier(items: self.selectedImages.count, itemWidth: 300, itemSpacing: 30))
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView(selectedImages:[PostPhoto(image:UIImage(imageLiteralResourceName:"mcd1"), isCoverPhoto:true),
             PostPhoto(image:UIImage(imageLiteralResourceName:"mcd2"), isCoverPhoto:false),
             PostPhoto(image:UIImage(imageLiteralResourceName:"mcd3"), isCoverPhoto:false),
             PostPhoto(image:UIImage(imageLiteralResourceName:"mcd4"), isCoverPhoto:false)])
    }
}
