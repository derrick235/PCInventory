//
//  PCSheetHeader.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct PCSheetHeader: View {
    @Binding var sheetOpen: Bool
    @State var imageIcon: String = ""
    @State var title: String
    
    var body: some View {
        HStack {
            Image(systemName: imageIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25)
                .padding(.leading, 20)
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading, 5)
            Spacer()
            Button {
                sheetOpen.toggle()
            } label: {
                CloseButton()
                    .padding(.trailing, 20)
            }
                
        }
    }
}

/*struct PCSheetHeader_Previews: PreviewProvider {
    static var previews: some View {
        PCSheetHeader()
    }
}*/
