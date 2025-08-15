//
//  Item.swift
//  AI-Notes
//
//  Created by Suraj-KU on 04/08/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
