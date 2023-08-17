//
//  PC.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/16/23.
//

import Foundation
import SwiftUI

struct PC: Identifiable, Codable {
    
    var id: String
    var firstName: String
    var lastName: String
    var isReplaced: Bool
    var pcLocation: String
    var pcSN: String
    var pcType: String
    var replacedBy: String
    var status: String
    
    func getPCImageName() -> String {
        
        if (self.pcType == "Dell Laptop" || self.pcType == "MacBook" || self.pcType == "HP Laptop") {
            return "laptopcomputer"
        }
        else if (self.pcType == "iMac") {
            return "desktopcomputer"
        }
        else if (self.pcType == "Dell OptiPlex" || self.pcType == "HP EliteDesk") {
            return "tv.and.mediabox"
        }
        else {
            return "display"
        }
        
    }
    
    func statusIcon() -> String {
        
        if self.status == "Active" {
            return "checkmark.circle.fill"
        }
        else if self.status == "Pending Replace" || self.status == "Pending Use" {
            return "arrow.left.arrow.right.circle.fill"
        }
        else {
            return "x.circle.fill"
        }
        
    }
    
    func statusColor() -> Color {
        
        if self.status == "Active" {
            return Color.green
        }
        else if self.status == "Pending Replace" || self.status == "Pending Use" {
            return Color.yellow
        }
        else {
            return Color.red
        }
        
    }
    
    func replaceString() -> String {
        
        if isReplaced {
            return "Yes"
        }
        return "No"
        
    }
    
}

