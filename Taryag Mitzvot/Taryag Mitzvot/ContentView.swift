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
    
    
    
    init() {
//        Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Colors.gold)]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Colors.gold)]

        UINavigationBar.appearance().tintColor = UIColor(Colors.gold)
        UINavigationBar.appearance().barTintColor = UIColor(Colors.blue)
        UINavigationBar.appearance().isTranslucent = false
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = .black
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(Colors.lightBlue)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
        UITextField.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).textColor = UIColor(Colors.gold)
        
    }
    
    @State private var text = ""
    @State private var isEditing = false
    
    @State private var showingSheet = false
    
    var body: some View {
        
        ZStack {
            Colors.blue
                .ignoresSafeArea()
                .opacity(1.0)
            
            VStack {
                
                NavigationStack {
                    
//                    SearchBar(text: $searchText)
//                        .padding(.bottom, 0)
                        
                    List {
                        if !searchResults.isEmpty {
                            ForEach(searchResults, id: \.self) { mitzvah in
                                
                                if let i = mitzvot.firstIndex(of: mitzvah) {
                                    NavigationLink(mitzvah.title) {
                                        DetailView(mitzvah: $mitzvot[i])
                                    }
                                }
                                
                            }
                        } else {
                            Text("No Results")
                        }
                        
                        
                    }
                    .background(Colors.blue)
                    .scrollContentBackground(.hidden)
                    .navigationTitle(Text("Mitzvot"))
                    .toolbar {
                        Button() {
                            print("filter button pressed")
                            filterButtonPressed()
                            showingSheet.toggle()
                        } label: {
//                            Image(systemName: "line.horizontal.3.decrease")
//                            Image(systemName: "slider.horizontal.3")
                            Image(systemName: "line.3.horizontal.decrease")
//                            Image(systemName: "tag")
//                            Image(systemName: "tag.fill")
                            
                        }
                        .sheet(isPresented: $showingSheet) {
                            SheetView(mitzvot: mitzvot)
                                .presentationDetents([.medium])
                        }
                        
                    }
                    
                }
                .accentColor(Colors.gold)
                .searchable(text: $searchText)
                
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
    
    func filterButtonPressed() {
        
    }
    
    
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    let mitzvot: [Mitzvah]

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var mitzvah: Mitzvah
    
    
    var body: some View {
        
        
        ZStack {
//            Color("myBlue")
//                .opacity(0.1)
//                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Spacer()
                    Text(mitzvah.title).font(.system(size: 28)).padding().multilineTextAlignment(.center)
                        .shadow(color: Colors.gold, radius: 10)
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
                    
                    nc.navigationBar.barTintColor = UIColor(Colors.blue)
                    nc.navigationBar.isTranslucent = true
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
