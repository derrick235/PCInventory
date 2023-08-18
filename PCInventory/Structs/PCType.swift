//
//  PCType.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/18/23.
//

import Foundation

// make enum CaseIterable and Identifiable so we can use the picker in the add view
enum PCType: CaseIterable, Identifiable {
    
    case dellLaptop, macbook, hpLaptop, imac, dellOpti, hpEliteDesk
    
    // id required for Identifiable
    var id: PCType { self }
    
    // return string version of the enum
    func typeString() -> String {
        
        switch self {
            
            case .dellLaptop:
                return "Dell Laptop"
            case .macbook:
                return "MacBook"
            case .hpLaptop:
                return "HP Laptop"
            case .imac:
                return "iMac"
            case .dellOpti:
                return "Dell OptiPlex"
            case .hpEliteDesk:
                return "HP EliteDesk"
            
        }
        
    }
    
}
