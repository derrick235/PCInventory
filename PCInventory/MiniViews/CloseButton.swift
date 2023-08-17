//
//  CloseButton.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct CloseButton: View {
    var body: some View {
        ZStack {
            
            Circle()
                .foregroundColor(.gray
                    .opacity(0.3))
                .frame(width: 40)
            
            Image(systemName: "xmark")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            
        }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}
