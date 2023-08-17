//
//  NavBarView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct NavBarView: View {
    @State var title: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            LogoView(whiteBckgrd: true) // logo
                .padding(.vertical, 20)
            
            HStack {
                
                Text(title) // title of navigation bar
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 20)
                
            }.padding(.bottom, 10)
                
        }
        .background(GradientView())
        
        
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NavBarView(title: "PCs")
            Spacer()
        }
    }
}
