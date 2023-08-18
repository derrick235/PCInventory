//
//  UserListView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/18/23.
//

import SwiftUI

struct UserListView: View {
    @StateObject var pcManager = PCManager()
    
    var body: some View {
        // nav bar
        NavBarContainerNavigationView(navTitle: "Users") {
            
            List {
                
                // stat views
                HStack {
                    
                    StatView(statTitle: "PC Migration", statProgress: 35, statUnit: " migrated")
                    StatView(statTitle: "Active Users", statProgress: 82, statUnit: " active")
                }.listRowBackground(Color(.secondarySystemBackground))
                
                // all users
                Section("USERS") {
                    
                    // 2 arrays are returned: one for all firstNames and one for all lastNames
                    let result: ([String], [String]) = pcManager.getUsers()
                    
                    let firstNames: [String] = result.0
                    let lastNames: [String] = result.1
                    let numUsers = firstNames.count
                    
                    ForEach(0..<numUsers) { i in
                        
                        NavigationLink {
                            UserDetailView(firstName: firstNames[i], lastName: lastNames[i])
                        } label: {
                            UserView(firstName: firstNames[i], lastName: lastNames[i])
                        }
                        
                    }
                    
                }
                
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
