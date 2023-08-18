//
//  AddPCCompleteView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/18/23.
//

import SwiftUI

struct AddPCCompleteView: View {
    
    @Binding var showSheet: Bool
    
    var body: some View {
        NavigationStack {
            
            PCSheetHeaderAdd()
            
            Spacer()
            
            HeaderCaption(imageName: "checkmark.circle", header: "And done.", caption: "Your new PC has been added.")
            
            Spacer()
            
            NavigationLink {
                AddUserView(showSheet: $showSheet)
            } label: {
                ButtonLabel(text: "Add Another PC")
                    .padding(.bottom, 10)
            }
            Text("Swipe down to dismiss")
                .fontWeight(.bold)
                .foregroundColor(Color.black.opacity(0.5))
                .padding(.bottom, 80)
            
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showSheet.toggle()
                } label: {
                    CloseButton()
                }
            }
        }
    }
}

/*struct AddPCCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        AddPCCompleteView()
    }
}
*/
