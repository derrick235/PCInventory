//
//  DetailItem.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

// view for each item in the PCDetailView

struct DetailItem: View {
    
    @State var itemIcon: String
    @State var itemType: String
    @State var itemInfo: String
    @State var imageInfo: String = ""
    @State var imageInfoColor: Color = Color.green
    
    var body: some View {
        
        HStack {
            Image(systemName: itemIcon)
                .frame(width: 30)
            Text(itemType)
                .fontWeight(.bold)
            Spacer()
            IconTextView(imageName: imageInfo, imageColor: imageInfoColor, text: itemInfo)
        }
        
    }
    
}

struct DetailItem_Previews: PreviewProvider {
    static var previews: some View {
        DetailItem(itemIcon: "checkmark", itemType: "Correct", itemInfo: "Yes")
    }
}
