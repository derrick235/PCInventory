//
//  IconTextView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct IconTextView: View {
    
    @State var imageName: String
    @State var imageColor: Color = Color.black
    @State var text: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(imageColor)
                .frame(width: 30)
                .padding(.trailing, -5)
            Text(text)
        }
    }
}

struct IconTextView_Previews: PreviewProvider {
    static var previews: some View {
        IconTextView(imageName: "checkmark", text: "Active")
    }
}
