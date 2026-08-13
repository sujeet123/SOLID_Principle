//
//  Item.swift
//  SOLID_Principle
//
//  Created by Sujeet kumar on 13/08/26.
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
