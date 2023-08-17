//
//  NavBarContainerNavigationView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

// "trick" to add the navigation view below a custom navigation bar
struct NavBarContainerNavigationView<Content: View>: View {
    var navTitle: String = "PCs"
    
    let content: Content
    
    // pass in navTitle and content into the variables of the struct
    init(navTitle: String, @ViewBuilder content: () -> Content) {
        
        self.content = content()
        self.navTitle = navTitle
        
    }
    
    var body: some View {
        
        NavigationView {
            // add the view we made for the navbar + content inside a navigation view
            // to get features of a navigationview
            VStack {
                NavBarContainerView(title: navTitle) {
                    
                    content
                    
                }
                .navigationBarHidden(true)
            }
                
        }
    }
}

struct NavBarContainerNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarContainerNavigationView(navTitle: "PCs") {
            List {
                Text("hey")
            }
        }
    }
}
