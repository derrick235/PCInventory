//
//  ButtonLabel.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct ButtonLabel: View {
    @State var buttonColor:Color = Color.accentColor
    @State var textColor: Color = Color.white
    @State var text:String = "OK"
    
    var body: some View {

        Text(text)
            .fontWeight(.bold)
            .foregroundColor(textColor)
            .frame(width: UIScreen.main.bounds.width - 80)
            .padding()
            .background(buttonColor)
            .cornerRadius(10)
    }
}

struct ButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabel()
    }
}
