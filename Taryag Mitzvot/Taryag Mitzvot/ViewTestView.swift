//
//  ViewTestView.swift
//  Taryag Mitzvot
//
//  Created by Snir Avrahami on 3/5/23.
//

import SwiftUI

struct ViewTestView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var mitzvah = Mitzvah.addMitzvot()[0]
    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    Text("\(mitzvah.engText)").font(.system(size: 24))
                    Spacer()
                    Text("\(mitzvah.hebText)").font(.system(size: 24))
                } .padding()
                Spacer()
                Text(mitzvah.verse).font(.system(size: 32))
                Spacer()
                Spacer()
                Spacer()
            } .navigationTitle(mitzvah.title)
                .navigationBarTitleDisplayMode(.large)
        }
        
        
        
        
        
    }
}



struct ViewTestView_Previews: PreviewProvider {
    static var previews: some View {
        ViewTestView()
    }
}
