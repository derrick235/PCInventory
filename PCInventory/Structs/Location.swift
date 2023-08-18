//
//  Location.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/18/23.
//

import Foundation

// make enum CaseIterable and Identifiable so we can use the picker in the add view
enum Location: CaseIterable, Identifiable {
    
    case manhattan, sf, boston, michigan, chicago
    
    // id required for Identifiable
    var id: Location { self }
    
    // return string version of the enum
    func locationString() -> String {
        
        switch self {
            
            case .manhattan:
                return "Manhattan"
            case .sf:
                return "San Francisco"
            case .boston:
                return "Boston"
            case .michigan:
                return "Michigan"
            case .chicago:
                return "Chicago"
            
        }
        
    }
    
}
