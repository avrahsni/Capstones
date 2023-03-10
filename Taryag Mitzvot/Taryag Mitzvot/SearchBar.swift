//
//  SearchBar.swift
//  Taryag Mitzvot
//
//  Created by Snir Avrahami on 3/6/23.
//

import SwiftUI
 
struct SearchBarv: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        ZStack {
            
//            Color("myBlue")
//                .frame()
            
            HStack {
                
                
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color("lightBlue"))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                     
                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
                    
                    .onTapGesture {
                        self.isEditing = true
                    }
                    .background(Color("myBlue"))
            }
 
            
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
//                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default, value: 1)
//                .animation(.default)
            }
        }
    }
}
