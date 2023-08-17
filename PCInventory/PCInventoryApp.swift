//
//  PCInventoryApp.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/16/23.
//

import SwiftUI
import Firebase

@main
struct PCInventoryApp: App {
    
    init() {
        
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
