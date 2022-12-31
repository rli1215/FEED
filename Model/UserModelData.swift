//
//  ProfileModelData.swift
//  FEED (iOS)
//
//  Created by Rachel Li on 10/11/22.
//

import Foundation
import Combine

final class UserModelData: ObservableObject {
    @Published var userData: [UserModel] = load("userData.json")
    
    @Published var profileDefault = UserModel.default
}
