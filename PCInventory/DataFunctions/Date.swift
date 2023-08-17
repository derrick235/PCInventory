//
//  Date.swift
//  PCInventory
//
//  Created by Derrick Lu on 8/17/23.
//

import Foundation
import SwiftUI

func getDate() -> String {
    
    let date = Date()
    let weekday = date.formatted(.dateTime.weekday())
    let monthDay = date.formatted(.dateTime.day().month())
    
    return weekday + ", " + monthDay
    
}
