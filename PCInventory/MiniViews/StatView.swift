//
//  StatView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct StatView: View {
    
    @State var statTitle:String // title on top
    @State var statProgress:Int // percent progress of title
    @State var statUnit:String // unit that goes after % symbol
    @EnvironmentObject var pcManager: PCManager
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(statTitle)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Group {
                Text("\(statProgress)%")
                    .font(.title)
                    .fontWeight(.bold) +
                Text(statUnit)
            }.padding(.bottom, -3) // keep num close to the progress bar
            
            ProgressView(value: Float(statProgress), total: 100)
                .frame(width: UIScreen.main.bounds.width / 2 - 60)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        
    }
}

struct StatView_Previews: PreviewProvider {
    
    static var previews: some View {
        StatView(statTitle: "PC Migration", statProgress: 1, statUnit: "migrated")
    }
}
