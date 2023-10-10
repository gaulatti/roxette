//
//  Item.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/10/23.
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
