//
//  HeaderCaption.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct HeaderCaption: View {
    
    @State var imageName: String
    @State var header: String
    @State var caption: String
    
    var body: some View {
        VStack {
            
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80)
                .padding(.bottom, 20)
            
            Text(header)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
            
            Text(caption)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.bottom, 15)
            
        }
    }
}

struct HeaderCaption_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCaption(imageName: "checkmark", header: "Is this correct?", caption: "Please confirm your choice")
    }
}
