//
//  UserProfile.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/18/23.
//

import SwiftUI

struct UserProfile: View {
    @State var initials: String
    @State var inNavigation: Bool
    
    var body: some View {
        ZStack {
            
            // if in navigation, make the profile icon smaller as well as the font
            Circle()
                .frame(width: inNavigation ? 50 : 85)
                .foregroundColor(Color.gray)
            
            Text(initials)
                .foregroundColor(.white)
                .font(.system(inNavigation ? .title3 : .title, design: .rounded))
                .fontWeight(.bold)
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(initials: "DL", inNavigation: true)
    }
}
