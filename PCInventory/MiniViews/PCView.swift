//
//  PCView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct PCView: View {
    
    @State var pc: PC
    @State var inNavigation: Bool
    
    var body: some View {
        HStack {
                
            Image(systemName: pc.getPCImageName())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
                .padding(.leading, inNavigation ? 0 : 25.0)
                .padding(.trailing, 15.0)
            
            VStack(alignment: .leading) {
                
                Text("\(pc.firstName)'s \(pc.pcType)")
                    .font(.title2)
                    .fontWeight(.bold)
                IconTextView(imageName: pc.statusIcon(), imageColor: pc.statusColor(), text: pc.status)
                
            }
            
            Spacer()
            
        }
        .padding(.vertical)
        .background(Color.white
            .opacity(inNavigation ? 0 : 0.7))
        .cornerRadius(10)
        .padding(.leading, 5)
    }
}

struct PCView_Previews: PreviewProvider {
    static var previews: some View {
        PCView(pc: PC(id: "ASKCMAKSCAKM", firstName: "John", lastName: "Smith", isReplaced: false, pcLocation: "New York", pcSN: "MXCASADCMA", pcType: "MacBook", replacedBy: "N/A", status: "Active"), inNavigation: false)
    }
}
