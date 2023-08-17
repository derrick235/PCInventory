//
//  GradientView.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import SwiftUI

struct GradientView: View {
    
    @State var gradientAnimation: Bool = false
    @State var colorOne: Color = Color("LightBlue")
    @State var colorTwo: Color = Color("PalePurple")
    
    var body: some View {
        LinearGradient(colors: [colorOne, colorTwo], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            .hueRotation(.degrees(gradientAnimation ? 30 : 0))
            .onAppear {
                
                DispatchQueue.main.async { // forum https://developer.apple.com/forums/thread/682779 requires this so height doesn't keep changing in NavigationView
                    withAnimation(.easeInOut(duration: 5) // 5 seconds before reverting back
                        .repeatForever(autoreverses: true)) { // keep repeating
                            gradientAnimation.toggle() // switch gradient animation from true to false all the time
                    }
                }
                
            }
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
