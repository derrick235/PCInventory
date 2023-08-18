//
//  AddPCTypeView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/18/23.
//

import SwiftUI

struct AddPCTypeView: View {
    
    @State var firstName: String
    @State var lastName: String
    @State var pcSN: String
    @State var pcType: PCType = .dellOpti
    @Binding var showSheet: Bool
    
    @EnvironmentObject var pcManager: PCManager
    
    var body: some View {
        NavigationStack {
            
            PCSheetHeaderAdd()
            
            Spacer()
            
            HeaderCaption(imageName: "display.2", header: "Enter the PC model", caption: "This can be found in Settings > System or General > About.")
            
            // picker to select which model. it uses the PCType enum to get all cases to display in the picker
            HStack {
                // name/label on the left
                Text("Model")
                    .fontWeight(.bold)
                
                Spacer()
                
                // picker
                Picker("Model", selection: $pcType) {
                    ForEach(PCType.allCases) { type in
                        Button {
                            pcType = type // set the type selected equal to the var pcType
                        } label: {
                            Text(type.typeString())
                        }
                    }
                }
            }.padding(20)
                .frame(width: UIScreen.main.bounds.width - 40)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            
            Spacer()
            
            NavigationLink {
                AddPCLocationView(firstName: firstName, lastName: lastName, pcSN: pcSN, pcType: pcType, showSheet: $showSheet)
            } label: {
                ButtonLabel(text: "Next")
                    .padding(.bottom, 80)
            }.environmentObject(PCManager())
            
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

/*struct AddPCTypeView_Previews: PreviewProvider {
    static var previews: some View {
        AddPCTypeView()
    }
}*/
