//
//  CreatePostView.swift
//  FEED
//
//  Created by Rachel Li on 12/30/22.
//

import SwiftUI

struct CreatePostView: View {
    @State private var isShowPhotoLibrary = false
    @State private var selectedImages = [UIImage]()
    
    var body: some View {
        if isShowPhotoLibrary {
            Text("Hello World")
        }
        else {
            PhotoSelectView()
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
