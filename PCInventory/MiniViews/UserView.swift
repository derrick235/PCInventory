//
//  UserView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/18/23.
//

import SwiftUI

struct UserView: View {
    @State var firstName: String
    @State var lastName: String
    @StateObject var pcManager = PCManager()
    
    var body: some View {
        
        HStack {
            
            // get the first letter in first and last names
            UserProfile(initials: "\(firstName.prefix(1))\(lastName.prefix(1))", inNavigation: true)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                
                // name printed out
                Text(firstName + " " + lastName)
                    .font(.title3)
                    .fontWeight(.bold)
                
                // get all the PCs that the user owns
                let usersPCs = pcManager.getUsersPCs(firstName: firstName, lastName: lastName)
                
                // display number of PCs (don't make PC plural if the count is equal to 1)
                if usersPCs.count == 1 {
                    Text("\(usersPCs.count) PC")
                }
                else {
                    Text("\(usersPCs.count) PCs")
                }
                
                
            }
            
            Spacer()
            
        }
        .cornerRadius(10)
        .padding(.vertical, 10)
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(firstName: "John", lastName: "Smith")
    }
}
