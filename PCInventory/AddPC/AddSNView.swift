//
//  AddSNView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct AddSNView: View {
    
    @State var firstName: String
    @State var lastName: String
    @State var pcSN: String = ""
    @Binding var showSheet: Bool
    @State var moveOn: Bool = false // variable is false until all fields are filled out
    
    @EnvironmentObject var pcManager: PCManager
    
    func emptyField() -> Bool {
        
        if pcSN.count > 0 {
            return false
        }
        return true
        
    }
    
    var body: some View {
        NavigationStack {
            
            PCSheetHeaderAdd()
            
            Spacer()
            
            HeaderCaption(imageName: "number", header: "Add the PC's SN", caption: "This can be found on the physical PC or in Settings > System or General > About.")
            
            TextFieldView(textFieldName: "Serial Number", bindingValue: $pcSN)
            
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
            }.background(NavigationLink(destination: AddPCTypeView(firstName: firstName, lastName: lastName, pcSN: pcSN, showSheet: $showSheet).environmentObject(PCManager())
                                        , isActive: $moveOn) {})
            
        }.presentationDragIndicator(.visible) // handle on top of the sheet
        .toolbar {
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
