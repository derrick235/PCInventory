//
//  TextFieldView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

// view for text fields in Add a PC screen

struct TextFieldView: View {
    
    @State var textFieldName: String
    @Binding var bindingValue: String
    
    var body: some View {
        TextField(textFieldName, text: $bindingValue)
            .padding(20)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            .padding(.horizontal, 20)
    }
}

/*struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}*/
