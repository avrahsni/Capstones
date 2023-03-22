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
    
    @State var showView = false
    
    @State var filters: [Tag] = UserDefaults().object(forKey: "filters") as? [Tag] ?? Tags.getTags()
    
    var settings = Array(0..<10).map({ _ in true })
    
    var body: some View {
        
        ZStack {
            Colors.blue
                .ignoresSafeArea()
                .opacity(1.0)
            
            VStack {
                
                NavigationStack {
                        
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
                        } label: {
//                            Image(systemName: "line.3.horizontal.decrease")
                            Image("filter")
                            
                        }
                        .sheet(isPresented: $showingSheet) {
                            SheetView(filters: $filters, mitzvot: mitzvot)
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
        
        var filtered: [Mitzvah] {
            var allFalse = [Bool]()
            for tag in filters {
                allFalse.append(tag.toggle)
            }
            if !allFalse.contains(true) {
                return mitzvot
            }
            
            var included = mitzvot
            var tags = [String]()
            
            for tag in filters {
                if tag.toggle {
                    tags.append(tag.name)
                }
            }
            
            for mitzvah in mitzvot {
                for tag in tags {
                    if !mitzvah.tags.contains(tag) && included.contains(mitzvah) {
                        included.remove(at: included.firstIndex(of: mitzvah)!)
                    }
                }
                
            }
            return included
        }
        
        if searchText.isEmpty {
            return filtered
        } else {
            let searchText = searchText.lowercased()
            return filtered.filter { $0.title.lowercased().contains(searchText) || $0.engText.lowercased().contains(searchText) || $0.hebText.stripVowels().contains(searchText) }
        }
    }
    
    func filterButtonPressed() {
        filters = populateFilterArray()
        showingSheet.toggle()
    }
    
    func populateFilterArray() -> [Tag] {
//        var filters = [Tag]()
        if filters.isEmpty {
            filters = Tags.getTags()
            print("got Tags")
        }
        return filters
    }
    
    
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var isModalSheetShown: Bool = false
    @State private var toggle = false
    
    var tags = Tags.getTags()
    
    @Binding var filters: [Tag]
    
    let mitzvot: [Mitzvah]
    
    
    var body: some View {
        
        ZStack {
            
            Colors.blue
                .ignoresSafeArea()
            
            NavigationStack {
                VStack {
                    
                    Form {
                        ForEach(0..<filters.count, id: \.self) { position in
                            HStack {
//                                let key = tags[position]
                                TagRow(tag: $filters[position])
                            }
                            
                        }
                        
//                        ForEach(getDictionary()) { (key, value) in
//                            let position: Int = getTags().firstIndex(of: tag)!
//                            HStack {
//                                Toggle(tag, isOn: $toggle)
//                            }
//
//                        }
                    }
                    .background(Colors.blue)
                    .scrollContentBackground(.hidden)
                    
                    
                }
                
                .navigationTitle(Text(("Filters")))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Reset", action: {
                            resetFilters()
                            self.dismiss()
                        })
                        
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done", action: {
                            self.dismiss()
                        })
                    }
                }
                .tint(Colors.gold)
                
            }
            .background(Colors.blue)
        }
        
        
    }
    
    func saveUserDefaults() {
        UserDefaults().set(filters, forKey: "filters")
    }
    
    func resetFilters() {
        for i in 0..<filters.count {
            if filters[i].toggle {
                filters[i].toggle = false
            }
        }
    }
    
    func getTags() -> [String : Bool] {
        var dict = [String : Bool]()
        for mitzvah in mitzvot {
            for tag in mitzvah.tags {
                if dict[tag] != nil {
                    dict[tag] = true
                }
            }
        }
        return dict
    }
    
    func setToggle(_ value: Bool) {
        toggle = value
    }
    
}

struct TagRow: View {
    
    @Binding var tag: Tag

    var body: some View {
        HStack {
            Toggle(tag.name, isOn: $tag.toggle)
        }
    }
}

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var mitzvah: Mitzvah
    
    
    var body: some View {
        
        
        ZStack {
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
            }
            
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        SheetView(filters: [Tag(name: "Testing 1"), Tag(name: "Testing 2"), Tag(name: "Testing 3")], mitzvot: Mitzvah.addMitzvot())
//    }
//}

extension String {
    func stripVowels() -> String {
        
        var text = ""
        
        for char in self {
            text.append(String(char.unicodeScalars.first!))
        }
        
        return text
    }
}

//extension Dictionary {
//    public init(keys: [Key], values: [Value]) {
//        precondition(keys.count == values.count)
//
//        self.init()
//
//        for (index, key) in keys.enumerated() {
//            self[key] = values[index]
//        }
//    }
//}

extension UserDefaults {
    var filters: [Tag] {
        get {
            value(forKey: #function) as! [Tag]
        } set {
            set(newValue, forKey: #function)
        }
    }
}
