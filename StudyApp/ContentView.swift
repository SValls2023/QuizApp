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
                ForEach(sets.cardSets) { cardSet in
                    NavigationLink(destination: CardSetView(cardSet: cardSet)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(cardSet.title)
                                    .font(.headline)
                                Text(cardSet.subject)
                            }
                            
                            Spacer()
                            
                            Text(cardSet.dateCreated, format: .dateTime.day().month().year())
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Index Card Sets")
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
        sets.cardSets.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
