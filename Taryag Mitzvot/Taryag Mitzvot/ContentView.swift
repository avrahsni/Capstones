//
//  ContentView.swift
//  Taryag Mitzvot
//
//  Created by Snir Avrahami on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var mitzvot = Mitzvah.addMitzvot()
    @State private var filteredMitzvot = Mitzvah.addMitzvot()
    @State private var searchText = ""
    
    @State private var searchBar = UISearchBar()
    
    init() {
//        Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("myGold"))]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("myGold"))]

        UINavigationBar.appearance().tintColor = UIColor(Color("myGold"))
        UINavigationBar.appearance().barTintColor = UIColor(Color("myBlue"))
        UINavigationBar.appearance().isTranslucent = false
        
        self.searchBar = UISearchBar()
        
        UISearchBar.appearance().barTintColor = UIColor(Color("lightBlue"))
//        UISearchBar.appearance().backgroundColor = UIColor(Color("lightBlue"))
        UISearchBar.appearance().tintColor = UIColor(Color("lightBlue"))
        searchBar.setTextFieldColor(UIColor(Color("lightBlue")))
    }
    
    @State private var text = ""
    @State private var isEditing = false
    
    var body: some View {
        
        ZStack {
            Color("myBlue")
                .ignoresSafeArea()
                .opacity(1.0)
            
            VStack {
                
                
                
                NavigationStack {
                    
                    SearchBar(text: $searchText)
                        .padding(.bottom, 0)
                        
                    List {
                        ForEach(searchResults, id: \.self) { mitzvah in
                            
                            if let i = mitzvot.firstIndex(of: mitzvah) {
                                NavigationLink(mitzvah.title) {
                                    GameView(mitzvah: $mitzvot[i])
                                }
                            }
                            
                        }
                        
                    }
                    .background(Color("myBlue"))
    //                .scrollContentBackground(.hidden)
                    .navigationTitle(Text("Mitzvot"))
        //            .toolbar(content: {
        //                ToolbarItem(placement: .) {
        //                    Color(.blue)
        //                }
        //            })
    //                .toolbarBackground(.blue)
        //            .toolbarBackground(
        //                // 1
        //                Color(.blue),
        //                // 2
        //                for: .navigationBar
        //            )
                }
                .accentColor(Color("myGold"))
//                .searchable(text: $searchText)
            }
            
            
            
        }
        
        
        
        
    }
    
    var searchResults: [Mitzvah] {
            if searchText.isEmpty {
                return mitzvot
            } else {
                let searchText = searchText.lowercased()
                return mitzvot.filter { $0.title.lowercased().contains(searchText) || $0.engText.lowercased().contains(searchText) || $0.hebText.stripVowels().contains(searchText) }
            }
        }
    
    
    
    
}

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var mitzvah: Mitzvah
    
//    init() {
//        //Use this if NavigationBarTitle is with Large Font
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
//
//        //Use this if NavigationBarTitle is with displayMode = .inline
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//
//        UINavigationBar.appearance().tintColor = UIColor(Color("myGold"))
//        UINavigationBar.appearance().barTintColor = UIColor(Color("myBlue"))
//
//    }
    
    var body: some View {
        
        
        ZStack {
//            Color("myBlue")
//                .opacity(0.1)
//                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Spacer()
                    Text(mitzvah.title).font(.system(size: 28)).padding().multilineTextAlignment(.center)
                        .shadow(color: Color("myGold"), radius: 10)
                    HStack {
                        Text("\(mitzvah.engText)").font(.system(size: 24)).multilineTextAlignment(.leading)
                        Spacer()
                        Text("\(mitzvah.hebText)").font(.system(size: 24)).multilineTextAlignment(.trailing)
                    } .padding()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .navigationTitle(mitzvah.verse)
                .navigationBarTitleDisplayMode(.automatic)
                .background(NavigationConfigurator { nc in
                    
                    nc.navigationBar.barTintColor = UIColor(Color("myBlue"))
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                })
//                .toolbarBackground(
//                    // 1
//                    Color("myBlue"),
//                    // 2
//                    for: .navigationBar
//                )
//                .shadow(color: Color("myBlue"), radius: 10)
            }
            
            
        }
            
        
        
        
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

extension String {
    func stripVowels() -> String {
        
        var text = ""
        
        for char in self {
            text.append(String(char.unicodeScalars.first!))
        }
        
        return text
    }
}

extension UISearchBar {
    func setTextFieldColor(_ color: UIColor) {
        for subView in self.subviews {
            for subSubView in subView.subviews {
                let view = subSubView as? UITextInputTraits
                if view != nil {
                    let textField = view as? UITextField
                    textField?.backgroundColor = color
                    break
                }
            }
        }
    }
}
