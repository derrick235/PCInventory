//
//  GetStartedView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct GetStartedView: View {
    
    @State var showSheet: Bool = false
    @StateObject var pcManager: PCManager = PCManager()
    
    var body: some View {
            
        NavigationStack {
            
            ZStack {
                
                GradientView()
                
                VStack {
                    
                    LogoView()
                        .padding(.vertical, 20)
                    
                    Spacer()
                    
                    HeaderCaption(imageName: "externaldrive.fill.badge.plus", header: "Get started on adding a new PC", caption: "We'll guide you on how to add a new PC without any hassle.")
                    
                    Spacer()
                    
                    NavigationLink {
                        
                    } label: {
                        
                        Button {
                            showSheet.toggle()
                        } label: {
                            ButtonLabel(text: "Get Started")
                                .padding(.bottom, 80)
                        }
                    }
                }
            }
            
        }.navigationBarHidden(true)
            .sheet(isPresented: $showSheet) {
                AddUserView(showSheet: $showSheet)
                    .environmentObject(PCManager())
            }
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
