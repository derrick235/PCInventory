//
//  AddPCLocationView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/18/23.
//

import SwiftUI

struct AddPCLocationView: View {
    @State var firstName: String
    @State var lastName: String
    @State var pcSN: String
    @State var pcType: PCType
    @State var pcLocation: Location = .manhattan
    
    @Binding var showSheet: Bool
    @EnvironmentObject var pcManager: PCManager
    
    var body: some View {
        NavigationStack {
            
            PCSheetHeaderAdd()
            
            Spacer()
            
            HeaderCaption(imageName: "location.fill", header: "Where is this PC?", caption: "Select between the locations in the picker below.")
            
            // picker to select which model. it uses the PCType enum to get all cases to display in the picker
            HStack {
                // name/label on the left
                Text("Location")
                    .fontWeight(.bold)
                
                Spacer()
                
                // picker
                Picker("Location", selection: $pcLocation) {
                    ForEach(Location.allCases) { location in
                        Button {
                            pcLocation = location // set the type selected equal to the var pcLocation
                        } label: {
                            Text(location.locationString())
                        }
                    }
                }
            }.padding(20)
                .frame(width: UIScreen.main.bounds.width - 40)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            
            Spacer()
            
            NavigationLink {
                AddPCStatusView(firstName: firstName, lastName: lastName, pcSN: pcSN, pcType: pcType, pcLocation: pcLocation, showSheet: $showSheet)
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

/*struct AddPCLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddPCLocationView()
    }
}*/
