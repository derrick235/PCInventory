//
//  UserDetailView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/18/23.
//

import SwiftUI

struct UserDetailView: View {
    @State var firstName: String
    @State var lastName: String
    @StateObject var pcManager = PCManager()
    
    var body: some View {
        
        // get all PCs that the user owns
        let usersPCs = pcManager.getUsersPCs(firstName: firstName, lastName: lastName)
        
        List {
            
            Section {
                
                HStack {
                    Spacer()
                    VStack {
                        
                        // profile picture
                        UserProfile(initials: "\(firstName.prefix(1))\(lastName.prefix(1))", inNavigation: false)
                        
                        // full name
                        Text(firstName + " " + lastName)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 5.0)
                        
                        // display number of PCs that the user owns
                        HStack {
                            if usersPCs.count == 1 {
                                Text("\(usersPCs.count) PC")
                            }
                            else {
                                Text("\(usersPCs.count) PCs")
                            }
                            
                        }
                        
                    }
                    Spacer()
                }
                
            }.listRowBackground(Color(.secondarySystemBackground))
            
            
            // display each PC
            ForEach(usersPCs, id: \.id) { computer in
                
                NavigationLink {
                    PCDetailView(pc: computer)
                        .environmentObject(pcManager)
                } label: {
                    PCView(pc: computer, inNavigation: true)
                }
                
                
            }
            
        }
        
    }
}

/*struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
    }
}*/
