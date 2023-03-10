//
//  ViewTestView.swift
//  Taryag Mitzvot
//
//  Created by Snir Avrahami on 3/5/23.
//

import SwiftUI

struct ViewTestView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let mitzvot: [Mitzvah] = Mitzvah.addMitzvot()
    
    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}



struct ViewTestView_Previews: PreviewProvider {
    static var previews: some View {
        ViewTestView()
    }
}
