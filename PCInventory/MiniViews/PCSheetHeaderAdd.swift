//
//  PCSheetHeaderAdd.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct PCSheetHeaderAdd: View {
    var body: some View {
        HStack {
            Image(systemName: "externaldrive.fill.badge.plus")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25)
                .padding(.leading, 20)
            Text("Add a PC")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading, 5)
            Spacer()
            
            Text(getDate())
                .fontWeight(.bold)
                .padding(.trailing, 20)
                
        }
    }
}

struct PCSheetHeaderAdd_Previews: PreviewProvider {
    static var previews: some View {
        PCSheetHeaderAdd()
    }
}
