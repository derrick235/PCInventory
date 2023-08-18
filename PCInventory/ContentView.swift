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
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
