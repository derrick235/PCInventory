//
//  DeleteView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct DeleteView: View {
    @Binding var sheetOpen: Bool
    @State var docID: String
    @State var pc: PC
    @EnvironmentObject var pcManager: PCManager
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                GradientView(colorOne: Color("LightRed1"), colorTwo: Color("LightRed2"))
                
                VStack {
                    
                    PCSheetHeader(sheetOpen: $sheetOpen, imageIcon: "trash", title: "Delete a PC")
                        .padding(.vertical, 20)
                    
                    Spacer()
                    
                    HeaderCaption(imageName: "display.trianglebadge.exclamationmark", header: "Are you sure you want to delete this PC?", caption: "This cannot be undone.")
                    
                    PCView(pc: pc, inNavigation: false)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    Button {
                        
                        pcManager.deletePC(docID: docID)
                        sheetOpen.toggle()
                        
                    } label: {
                        ButtonLabel(buttonColor: Color.red, text: "Delete")
                            .padding(.bottom, 10)
                    }
                    
                    Text("Swipe down to dismiss")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black.opacity(0.5))
                        .padding(.bottom, 80)
                }
            }
            
        }.navigationBarHidden(true)
            .presentationDragIndicator(.visible) // handle on top of the sheet
    }
}

/*struct DeleteView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteView(sheetOpen: <#T##Binding<Bool>#>, docID: <#T##String#>, pc: <#T##PC#>)
    }
}*/
