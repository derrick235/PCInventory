//
//  NavBarContainerView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

// view to add content below the NavBar
struct NavBarContainerView<Content: View>: View { // Content should be of type View
    
    var title: String = ""
    
    // specify content to place below navigation bar
    let content: Content // type View
    
    init (title: String, @ViewBuilder content: () -> Content) {
        
        self.content = content()
        self.title = title
        
    }
    
    var body: some View {
        ZStack {
            Color(.secondarySystemBackground)
            VStack {
                NavBarView(title: self.title)
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // take up rest of the screen
            }
        }
    }
}

struct NavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarContainerView(title: "Title") {
            List {
                Text("hi")
            }
            
        }
    }
}
