//
//  PCDetailView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct PCDetailView: View {
    @State var pc: PC
    @State var sheetOpen: Bool = false
    @EnvironmentObject var pcManager: PCManager
    
    var body: some View {
        
        NavigationView{
            
            List {
                
                Section {
                    
                    HStack {
                        Spacer()
                        VStack {
                            
                            Image(systemName: pc.getPCImageName())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 85)
                                .padding(.top, 50.0)
                                .padding(.bottom, 10.0)
                            
                            Text("\(pc.firstName)'s \(pc.pcType)")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 5.0)
                            HStack {
                                
                                Image(systemName: pc.statusIcon())
                                    .foregroundColor(pc.statusColor())
                                Text(pc.status)
                                
                            }
                            
                        }
                        Spacer()
                    }
                    
                }.listRowBackground(Color(.secondarySystemBackground))
                
                Section("Computer Details") {
                    
                    DetailItem(itemIcon: "person.fill", itemType: "User", itemInfo: pc.firstName + " " + pc.lastName)
                    
                    DetailItem(itemIcon: "number", itemType: "SN", itemInfo: pc.pcSN)
                    
                    DetailItem(itemIcon: "server.rack", itemType: "Type", itemInfo: pc.pcType)
                    
                    DetailItem(itemIcon: "location.fill", itemType: "Location", itemInfo: pc.pcLocation)

                    DetailItem(itemIcon: "power", itemType: "Status", itemInfo: pc.status , imageInfo: pc.statusIcon(), imageInfoColor: pc.statusColor())
                    
                }
                
                Section("Replacement Details") {
                    
                    DetailItem(itemIcon: "arrow.left.arrow.right.circle.fill", itemType: "Replaced", itemInfo: pc.replaceString())
                    
                    DetailItem(itemIcon: "rectangle.2.swap", itemType: "Replaced by", itemInfo: pc.replacedBy)
                    
                }
                
            }
            
        }.toolbar {
            
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button {
                    sheetOpen.toggle()
                } label: {
                    Image(systemName: "trash")
                }.sheet(isPresented: $sheetOpen) {
                    DeleteView(sheetOpen: $sheetOpen, docID: pc.id, pc: pc)
                        .environmentObject(pcManager)
                }
                
            }

        }
            
        
    }
}

struct PCDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PCDetailView(pc: PC(id: "ASKCMAKSCAKM", firstName: "John", lastName: "Smith", isReplaced: false, pcLocation: "New York", pcSN: "MXCASADCMA", pcType: "MacBook", replacedBy: "N/A", status: "Active"))
    }
}
