//
//  ViewTestView.swift
//  Taryag Mitzvot
//
//  Created by Snir Avrahami on 3/5/23.
//

import SwiftUI

struct ViewTestView: View {
    
    @Environment(\.dismiss) var dismiss
    
//    @StateObject var viewModel = ContentViewModel()
    
    let mitzvot: [Mitzvah] = Mitzvah.addMitzvot()
    
    var body: some View {
        Form {
            let tags = loadTags()
            ForEach(tags, id: \.self) { tag in
                Text(tag)
            }
        }
    }
    
    
    func loadTags() -> [String] {
        var tags = [String]()
        for mitzvah in mitzvot {
            for tag in mitzvah.tags {
                if !tags.contains(tag) {
                    tags.append(tag)
                }
            }
        }
        return tags
    }
    
    
    
}



struct ViewTestView_Previews: PreviewProvider {
    static var previews: some View {
        ViewTestView()
    }
}

