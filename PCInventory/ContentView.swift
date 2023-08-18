//
//  ContentView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            PCInventoryView()
                .tabItem {
                    Image(systemName: "display.2")
                    Text("PCs")
                }
            
            GetStartedView()
                .tabItem {
                    Image(systemName: "externaldrive.fill.badge.plus")
                    Text("Add")
                }
            
            UserListView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Users")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
