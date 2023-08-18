//
//  AddPCReplaceView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/18/23.
//

import SwiftUI

struct AddPCReplaceView: View {
    
    @State var firstName: String
    @State var lastName: String
    @State var pcSN: String
    @State var pcType: PCType
    @State var pcLocation: Location = .manhattan
    @State var pcStatus: Status = .active
    @State var newPCSN: String = ""
    @State var moveOn: Bool = false // variable is false until all fields are filled out
    
    @Binding var showSheet: Bool
    @EnvironmentObject var pcManager: PCManager
    
    func emptyField() -> Bool {
        
        if newPCSN.count > 0 {
            return false
        }
        return true
        
    }
    
    // add new PC to the database
    func addNewPC() {
        
        // if status is active, add a PC with "N/A" for new PC SN
        if pcStatus == Status.active {
            pcManager.sendPC(firstName: firstName, lastName: lastName, pcSN: pcSN, pcLocation: pcLocation.locationString(), pcType: pcType.typeString(), isReplaced: false, replacedBy: "N/A", status: pcStatus.statusString())
            
        // if status is discontinued, the PC must have been replaced. set isReplaced = true
        } else if pcStatus == Status.discontinued {
            
            pcManager.sendPC(firstName: firstName, lastName: lastName, pcSN: pcSN, pcLocation: pcLocation.locationString(), pcType: pcType.typeString(), isReplaced: true, replacedBy: newPCSN, status: pcStatus.statusString())
            
        // else, the status is pending and we set isReplaced equal to false as the migration is not yet complete
        } else {
            pcManager.sendPC(firstName: firstName, lastName: lastName, pcSN: pcSN, pcLocation: pcLocation.locationString(), pcType: pcType.typeString(), isReplaced: false, replacedBy: newPCSN, status: pcStatus.statusString())
        }
        
    }
    
    var body: some View {
        NavigationStack {
            
            PCSheetHeaderAdd()
            
            Spacer()
            
            HeaderCaption(imageName: "arrow.left.arrow.right.circle", header: "What is the SN of the PC that is replacing this PC?", caption: "This is not the SN that you entered before. Type N/A if the current PC is active.")
            
            TextFieldView(textFieldName: "Serial Number", bindingValue: $newPCSN)
            
            Spacer()
            
            // Place navigationLink inside a button for functionality where you cannot move on until all fields are filled.
            // When button is clicked, moveOn value will be updated based on if fields are empty.
            // Button will also change color once all fields are met.
            Button {
                moveOn = !(emptyField())
                if (!(emptyField())) {
                    addNewPC()
                }
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
            }.background(NavigationLink(destination: AddPCCompleteView(showSheet: $showSheet)
                                        , isActive: $moveOn) {}
            )
            
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showSheet.toggle()
                } label: {
                    CloseButton()
                }
            }
        }
        .presentationDragIndicator(.visible) // handle on top of the sheet
    }
}

/*struct AddPCReplaceView_Previews: PreviewProvider {
    static var previews: some View {
        AddPCReplaceView()
    }
}
*/
