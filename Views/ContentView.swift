//
//  ContentView.swift
//  Shared
//
//  Created by Rachel Li on 10/4/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    @EnvironmentObject var userModelData: UserModelData
    
    enum Tab {
        case home
        case post
        case profile
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("Feed", systemImage: "fork.knife.circle")
                }
                .tag(Tab.home)
            PhotoSelectView()
                .tabItem {
                    Label("Post", systemImage: "plus.circle")
                }
                .tag(Tab.post)

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "figure.wave")
                }
                .tag(Tab.profile)
                .environmentObject(userModelData)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserModelData())
            .environmentObject(RestaurantModelData())
    }
}
