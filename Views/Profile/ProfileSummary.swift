//
//  ProfileSummary.swift
//  FEED (iOS)
//
//  Created by Rachel Li on 10/11/22.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var userModelData: UserModelData
    var profile: UserModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(alignment: .center, spacing: 30) {
                HStack(alignment: .center, spacing: 30){
                    ProfileImage()
                    VStack(alignment: .leading, spacing: 15) {
                        Text("\(profile.firstName)  \(profile.lastName)")
                            .bold()
                            .font(.largeTitle)
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Boston, MA")
                            Text("Bio goes here")
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                VStack(spacing: 20){
                    VStack {
                        Text(String(profile.followingCount))
                        Text("Following")
                    }
                    VStack {
                        Text(String(profile.followersCount))
                        Text("Followers")
                    }
                }
                .padding([.trailing], 20)
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: UserModel.default)
            .environmentObject(UserModelData())
    }
}
