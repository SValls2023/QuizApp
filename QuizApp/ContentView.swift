//
//  ContentView.swift
//  QuizApp
//
//  Created by csuftitan on 11/23/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var sets = Sets()
    @State private var showingAddCategory = false

    var body: some View {
        NavigationView {
            List {
                ForEach(sets.items) { item in
                    NavigationLink(destination: CardSetView(cardSet: item)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.subject)
                            }
                            
                            Spacer()
                            
                            Text(item.dateCreated, format: .dateTime.day().month().year())
                        }
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
                AddIndexSet(sets: sets)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        sets.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
