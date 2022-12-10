//
//  ContentView.swift
//  QuizApp
//
//  Created by csuftitan on 11/23/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var categories = Categories()
    @State private var showingAddCategory = false

    var body: some View {
        NavigationView {
            List {
                ForEach(categories.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.subject)
                        }
                        
                        Spacer()
                        
                        Text("Card Amount: 10")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Index Cards")
            .toolbar {
                Button {
                    showingAddCategory = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddCategory) {
                AddIndexCatagory(categories: categories)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        categories.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
