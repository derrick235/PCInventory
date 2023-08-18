//
//  Status.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/18/23.
//

import Foundation

// make enum CaseIterable and Identifiable so we can use the picker in the add view
enum Status: CaseIterable, Identifiable {
    
    case active, pendingReplace, pendingUse, discontinued
    
    // id required for Identifiable
    var id: Status { self }
    
    // return string version of the enum
    func statusString() -> String {
        
        switch self {
            
            case .active:
                return "Active"
            case .pendingReplace:
                return "Pending Replace"
            case .pendingUse:
                return "Pending Use"
            case .discontinued:
                return "Discontinued"
            
        }
        
    }
    
}
