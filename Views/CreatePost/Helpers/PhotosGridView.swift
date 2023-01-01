//
//  PhotosGridView.swift
//  FEED (iOS)
//
//  Created by Rachel Li on 12/31/22.
//

import Foundation
import SwiftUI
import PhotosUI

struct PhotosGridView: View {
    @Binding var selectedImages: [PostPhoto]
    @Binding var coverPhoto: Int
    
    let columns = [GridItem(.fixed(120), spacing: 10), GridItem(.fixed(120), spacing: 10), GridItem(.fixed(120), spacing: 10)]
     
    var body: some View {
        VStack {
            HStack(alignment:.center) {
                Text("Select a cover photo for your post.")
                    .padding()
                Spacer()
                NavigationLink(destination: CreatePostView(selectedImages:rearrange(array:selectedImages, fromIndex:coverPhoto, toIndex:0))) {
                    Text("Next")
                        .foregroundColor(Color.blue)
                        .padding()
                }
            }
            ScrollView() {
                LazyVGrid(columns: columns) {
                    ForEach(Array(selectedImages.enumerated()), id:\.element) { index, element in
                        ZStack(alignment:.topTrailing) {
                            Image(uiImage:element.image)
                                .resizable()
                                .frame(width:120, height:120)
                            FavoriteButton(isSet: $selectedImages[index].isCoverPhoto,
                                           index: index,
                                           curIndex:$coverPhoto)
                            .padding([.top, .trailing], 5)
                            
                        }
                    }
                }
            }
        }
    }
}

func rearrange<T>(array: Array<T>, fromIndex: Int, toIndex: Int) -> Array<T>{
    var arr = array
    let element = arr.remove(at: fromIndex)
    arr.insert(element, at: toIndex)

    return arr
}


struct PhotosGridView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosGridView(selectedImages:.constant([PostPhoto(image:UIImage(imageLiteralResourceName:"mcd1"), isCoverPhoto:true),
           PostPhoto(image:UIImage(imageLiteralResourceName:"mcd2"), isCoverPhoto:false),
           PostPhoto(image:UIImage(imageLiteralResourceName:"mcd3"), isCoverPhoto:false),
           PostPhoto(image:UIImage(imageLiteralResourceName:"mcd4"), isCoverPhoto:false)]), coverPhoto:.constant(0))
    }
}
