//
//  CardSetView.swift
//  QuizApp
//
//  Created by csuftitan on 12/10/22.
//

import SwiftUI

struct CardSetView: View {
    @StateObject var cards = Cards()
    @State private var showingAddCategory = false

    
    let cardSet: IndexCardSet
    
    var body: some View {
        ScrollView {
            VStack {
                Text(cardSet.decription)
            }
                
            Divider()

            Section {
                ForEach(cards.items) { item in
                    NavigationLink(destination: CardView(card: item)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.term)
                                    .font(.headline)
                            }
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
        }
        .navigationTitle(cardSet.title)
        .toolbar {
            Button {
                showingAddCategory = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $showingAddCategory) {
            AddIndexCard(cards: cards)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        cards.items.remove(atOffsets: offsets)
    }
}

struct CardSetView_Previews: PreviewProvider {
    static var previews: some View {
        let itemSet: [IndexCardSet] = Sets().items
        CardSetView(cardSet: itemSet[0])
    }
}
