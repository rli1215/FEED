//
//  Profile.swift
//  FEED (iOS)
//
//  Created by Rachel Li on 10/4/22.
//

import Foundation

struct UserModel: Hashable, Codable, Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    var email: String
    var DOB: String
    
    var followersCount: Int
    var followingCount: Int
    var postsCount: Int
    var posts: [Post]
    var eatListCount: Int
    var eatList: [Int]
    
    static let defaultPosts = [Post(id:1001, restaurant:"McDonalds", rating:4, review:"McNuggets were great",images:["mcd1","mcd2","mcd3","mcd4","mcd5","mcd6"]), Post(id:1002, restaurant:"Bangkok Pinto", rating:4.5, review:"Love the terriyaki chicken fried rice", images:[])]
    static let defaultProfile = UserModel(id: 1001, firstName: "Rachel", lastName: "Li", email: "rachell1566@gmail.com", DOB: "12-15-2000", followersCount: 5, followingCount:5, postsCount:10, posts: defaultPosts, eatListCount: 5, eatList:[1001,1002])
    static let `default` = defaultProfile
}

struct Post: Hashable, Codable, Identifiable {
    var id: Int
    var restaurant: String
    var rating: Float
    var review: String
    var images: [String]
}


//func createDefault() -> UserModel {
//    var defaultDOB = DateComponents()
//    defaultDOB.year = 2000
//    defaultDOB.month = 12
//    defaultDOB.day = 15
//
//    let posts = [Post(id:1001, restaurant:"McDonalds", rating:4, review:"McNuggets were great",images:["mcd1","mcd2","mcd3","mcd4","mcd5","mcd6"]), Post(id:1002, restaurant:"Bangkok Pinto", rating:4.5, review:"Love the terriyaki chicken fried rice", images:[])]
//    let defaultProfile = UserModel(id: 1001, firstName: "Rachel", lastName: "Li", email: "rachell1566@gmail.com", DOB: "12-15-2000", followersCount: 5, followingCount:5, postsCount:10, posts: posts, eatListCount: 5, eatList:[1001,1002])
//     return defaultProfile
//
//}
