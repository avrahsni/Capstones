//
//  Tags.swift
//  Taryag Mitzvot
//
//  Created by Snir Avrahami on 3/13/23.
//

import Foundation

struct Tags {
    
    static var dict = getTags()
    
    static var mitzvot = Mitzvah.addMitzvot()
    
    static func getTags() -> [Tag] {
        var tags = [Tag]()
        for mitzvah in Mitzvah.addMitzvot() {
            for tag in mitzvah.tags {
                if !tags.contains(Tag(name: tag)) {
                    tags.append(Tag(name: tag))
                }
            }
        }
        return tags
    }
    
}
