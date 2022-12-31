//
//  FEEDApp.swift
//  Shared
//
//  Created by Rachel Li on 10/4/22.
//

import SwiftUI

@main
struct FEEDApp: App {
    @StateObject private var modelData = RestaurantModelData()
    @StateObject private var userModelData = UserModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userModelData)
        }
    }
}
