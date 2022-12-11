//
//  AddIndexCatagory.swift
//  QuizApp
//
//  Created by csuftitan on 12/10/22.
//

import SwiftUI

struct AddIndexSet: View {
    @ObservedObject var sets: Sets
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var subject = "English"
    @State private var description = ""
    @State private var numberOfCards = 0
    @State private var dateCreated = Date.now
    
    let subjects = ["English", "History", "Math", "Science"]
    
    var body: some View {
        NavigationView{
            Form {
                TextField("Title", text: $title)
                
                Picker("Subject", selection: $subject){
                    ForEach(subjects, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new card set")
            .toolbar {
                Button("Save") {
                    let item = IndexCardSet(title: title, subject: subject, decription: description, numberOfCards: numberOfCards, dateCreated: dateCreated)
                    sets.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddIndexCatagory_Previews: PreviewProvider {
    static var previews: some View {
        AddIndexSet(sets: Sets())
    }
}
