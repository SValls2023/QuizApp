//
//  AddIndexCatagory.swift
//  QuizApp
//
//  Created by csuftitan on 12/10/22.
//

import SwiftUI

struct AddIndexCatagory: View {
    @ObservedObject var categories: Categories
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var subject = "English"
    @State private var description = ""
    
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
            .navigationTitle("Add new category")
            .toolbar {
                Button("Save") {
                    let item = IndexCardCategory(title: title, subject: subject, decription: description)
                    categories.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddIndexCatagory_Previews: PreviewProvider {
    static var previews: some View {
        AddIndexCatagory(categories: Categories())
    }
}
