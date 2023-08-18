//
//  AddUserView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct AddUserView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @Binding var showSheet: Bool
    @State var moveOn: Bool = false // variable is false until all fields are filled out
    
    @EnvironmentObject var pcManager: PCManager
    
    // check if fields are empty. if empty, button is grayed out
    func emptyField() -> Bool {
        
        if firstName.count > 0 && lastName.count > 0 {
            return false
        }
        return true
        
    }
    
    var body: some View {
        NavigationStack {
            
            PCSheetHeader(sheetOpen: $showSheet, imageIcon: "externaldrive.fill.badge.plus", title: "Add a PC")
                .padding(.vertical, 20)
            
            Spacer()
            
            HeaderCaption(imageName: "externaldrive.fill.badge.person.crop", header: "Who owns this PC?", caption: "Enter the user's first and last name below.")
            
            TextFieldView(textFieldName: "First Name", bindingValue: $firstName)
            TextFieldView(textFieldName: "Last Name", bindingValue: $lastName)
            
            Spacer()
            
            // Place navigationLink inside a button for functionality where you cannot move on until all fields are filled.
            // When button is clicked, moveOn value will be updated based on if fields are empty.
            // Button will also change color once all fields are met.
            Button {
                moveOn = !(emptyField())
            } label: {
                Text("Next")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .padding()
                    .background(emptyField() ? Color.gray : Color.accentColor)
                    .cornerRadius(10)
                    .animation(Animation.easeIn(duration: 0.2))
                    .padding(.bottom, 80)
            }.background(NavigationLink(destination: AddSNView(firstName: firstName, lastName: lastName, showSheet: $showSheet).environmentObject(PCManager())
                                        , isActive: $moveOn) {})
            
        }
    }
}
