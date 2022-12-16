//
//  AddIndexCard.swift
//  QuizApp
//
//  Created by csuftitan on 12/15/22.
//

import SwiftUI

struct AddIndexCard: View {
    @ObservedObject var cards: Cards
    @Environment(\.dismiss) var dismiss
    
    @State private var term = ""
    @State private var definition = ""
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("Term", text: $term)
    
                    TextField("Definition", text: $definition, axis: .vertical)
                        .frame(height: 120)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.leading, .trailing], 4)
                }
            }
            .navigationTitle("Create new index card")
            .toolbar {
                Button("Save") {
                    let item = IndexCard(term: term, definition: definition)
                    cards.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddIndexCard_Previews: PreviewProvider {
    static var previews: some View {
        AddIndexCard(cards: Cards())
    }
}
