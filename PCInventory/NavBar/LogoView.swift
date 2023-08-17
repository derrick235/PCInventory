//
//  LogoView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct LogoView: View {
    
    // if there is a white background, do not add shadow to text
    // or make the text white
    @State var whiteBckgrd:Bool = true
    
    var body: some View {
        HStack {
            
            // pc inventory logo
            Text("PCInventory")
                .font(.title2)
                .fontWeight(.bold)
                .fontWidth(.expanded)
                .padding(.leading, 20)
            
            Spacer()
            
            Text(getDate())
                .fontWeight(.bold)
                .padding(.trailing, 20)
                .foregroundColor(whiteBckgrd ? Color.black : Color.white)
                .shadow(color: .black, radius: whiteBckgrd ? 0 : 7)
                
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
