//
//  PostsView.swift
//  FEED
//
//  Created by Rachel Li on 12/22/22.
//

import Foundation
import SwiftUI

struct PostsView: View {
    @EnvironmentObject var userModelData: UserModelData
    var profile: UserModel
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Posts")
                .bold()
                .font(.headline)
                .padding(.leading,20)
            List() {
                ForEach(profile.posts) { post in
                    PostRow(post: post)
                }
            }
            .listStyle(.inset)
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView(profile: UserModel.default)
            .environmentObject(UserModelData())
    }
}
