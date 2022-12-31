//
//  Profile.swift
//  FEED (iOS)
//
//  Created by Rachel Li on 10/5/22.
//

import SwiftUI

extension Color {
    static let ui = Color.UI()
    
    struct UI {
         let teal = Color("teal")
    }
}

struct ProfileView: View {
    @EnvironmentObject var userModelData: UserModelData
    @EnvironmentObject var restaurantModelData: RestaurantModelData
    @State private var profile = UserModel.default
    @State private var restaurants = [RestaurantModel.default]
    @State private var showPosts = true
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing:20) {
                ProfileSummary(profile: profile)
                    .padding([.top, .bottom],10)
                HStack(alignment: .center, spacing: 0) {
                    Button {
                        showPosts = true
                    } label: {
                        Text("\(profile.postsCount) Posts")
                            .foregroundColor(showPosts ? Color.white : Color.black)
                            .frame(width: 200, height: 40)
                    }
                    .border(Color.black)
                    .background(showPosts ? Color.ui.teal : Color.clear)
                    Button {
                        showPosts = false
                    } label: {
                        Text("\(profile.eatListCount) Eat List")
                            .foregroundColor(showPosts ? Color.black : Color.white)
                            .frame(width: 200, height: 40)
                    }
                    .border(Color.black)
                    .background(!showPosts ? Color.ui.teal : Color.clear)
                }
                if showPosts {
                    PostsView(profile: profile)
                }
                else {
                    EatListView(restaurants: restaurants)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserModelData())
            .environmentObject(RestaurantModelData())
    }
}
