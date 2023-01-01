//
//  PostSelectView.swift
//  FEED
//
//  Created by Rachel Li on 12/29/22.
// Source: https://www.appcoda.com/swiftui-camera-photo-library/
// https://gist.github.com/oalansari82/b00371fc81a21a64ce58e27501c3c7de

import Foundation
import SwiftUI
import PhotosUI

struct PhotoSelectView: View {
    @State private var isShowPhotoLibrary = false
    @State private var selectedImages = [PostPhoto]()
    @State private var coverPhoto: Int = 0
    
    let columns = [GridItem(.fixed(120), spacing: 10), GridItem(.fixed(120), spacing: 10), GridItem(.fixed(120), spacing: 10)]
     
    var body: some View {
        NavigationView {
            VStack {
                if selectedImages.count > 0 {
                    PhotosGridView(selectedImages:$selectedImages, coverPhoto: $coverPhoto)
                } else {
                    Image(systemName: "photo.artframe")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.gray.opacity(0.6))
                        .padding()
                    Button(action: {
                        self.isShowPhotoLibrary = true
                    }) {
                        HStack {
                            Image(systemName: "photo")
                                .font(.system(size: 20))
                            
                            Text("Photo library")
                                .font(.headline)
                        }
                        .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }
                }
            }
            .sheet(isPresented: $isShowPhotoLibrary) {
                PhotoPicker(images: self.$selectedImages, selectionLimit: 12)
            }
        }
    }
}

struct PhotoSelectView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSelectView()
    }
}
