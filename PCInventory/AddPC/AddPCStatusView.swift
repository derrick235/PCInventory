//
//  AddPCStatusView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/18/23.
//

import SwiftUI

struct AddPCStatusView: View {
    
    @State var firstName: String
    @State var lastName: String
    @State var pcSN: String
    @State var pcType: PCType
    @State var pcLocation: Location = .manhattan
    @State var pcStatus: Status = .active
    
    @Binding var showSheet: Bool
    @EnvironmentObject var pcManager: PCManager
    
    var body: some View {
        NavigationStack {
            
            PCSheetHeaderAdd()
            
            Spacer()
            
            HeaderCaption(imageName: "externaldrive.fill.badge.checkmark", header: "Is this PC active?", caption: "You can also select if the PC is pending replacement or use in the near future.")
            
            HStack {
                Text("Status")
                    .fontWeight(.bold)
                Spacer()
                Picker("Status", selection: $pcStatus) {
                    ForEach(Status.allCases) { status in
                        Button {
                            pcStatus = status
                        } label: {
                            Text(status.statusString())
                        }
                    }
                }.environmentObject(pcManager)
            }.padding(20)
                .frame(width: UIScreen.main.bounds.width - 40)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            
            Spacer()
            
            NavigationLink {
                AddPCReplaceView(firstName: firstName, lastName: lastName, pcSN: pcSN, pcType: pcType, pcLocation: pcLocation, pcStatus: pcStatus, showSheet: $showSheet)
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

/*struct AddPCStatusView_Previews: PreviewProvider {
    static var previews: some View {
        AddPCStatusView()
    }
}*/
