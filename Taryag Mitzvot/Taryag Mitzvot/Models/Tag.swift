//
//  Tag.swift
//  Taryag Mitzvot
//
//  Created by Snir Avrahami on 3/10/23.
//

import Foundation
import SwiftUI

struct Tag: Hashable {
    var name: String
    var toggle = false
    
    init(name: String) {
        self.name = name
//        self.toggle = toggle
    }
}
