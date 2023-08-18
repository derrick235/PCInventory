//
//  PCInventoryView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct PCInventoryView: View {

    @StateObject var pcManager = PCManager()
    
    var body: some View {
        NavBarContainerNavigationView(navTitle: "PCs") {
            List {
                
                HStack {
                    
                    StatView(statTitle: "PC Migration", statProgress: 35, statUnit: " migrated")
                        .environmentObject(pcManager)

                    StatView(statTitle: "Active Users", statProgress: 82, statUnit: " active")
                        .environmentObject(pcManager)
                    
                }.listRowBackground(Color(.secondarySystemBackground))
                
                Section("COMPUTERS") {
                    
                    ForEach(pcManager.pcs, id: \.id) { pc in
                        
                        NavigationLink {
                            PCDetailView(pc: pc)
                                .environmentObject(pcManager)
                        } label: {
                            PCView(pc: pc, inNavigation: true)
                        }
                        
                    }
                    
                }
                
            }
        }
    }
}

struct PCInventoryView_Previews: PreviewProvider {
    static var previews: some View {
        PCInventoryView()
    }
}
