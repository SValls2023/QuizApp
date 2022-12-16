//
//  NotesView.swift
//  QuizApp
//
//  Created by csuftitan on 12/16/22.
//

import SwiftUI

struct NotesView: View {
    @State private var data: [String] = Array(arrayLiteral: "Test note", "Hello World", "This is a longer note")
    @State private var newNote = ""
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
            ScrollView {
                TextField("Make a note", text: $newNote)
                    .padding()
                Divider()
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(data, id: \.self) { note in
                        ZStack {
                            Rectangle()
                                .frame(width: 150, height: 150)
                                .foregroundColor(.gray)
                                .cornerRadius(30)
                            Text("\(note)")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium, design: .rounded))
                        }
                    }
                }
            }
            .navigationTitle("Notes")
            .onSubmit(addNote)
    }
    func addNote() {
        let note = newNote
        withAnimation {
            data.insert(note, at: 0)
        }
        newNote = ""
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
