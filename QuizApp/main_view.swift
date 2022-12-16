//
//  main_view.swift
//  QuizApp
//
//  Created by csuftitan on 12/15/22.
//

import SwiftUI

struct main_view: View {
    var body: some View {
        TabView {
            NotesView()
                .tabItem {
                    Label("Notes", systemImage: "note")
                }
            
            ContentView()
                .tabItem {
                    Label("Terms", systemImage: "rectangle.and.pencil.and.ellipsis")
                }
            
            TimerView()
                .tabItem{
                    Label("Game", systemImage: "gamecontroller")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct main_view_Previews: PreviewProvider {
    static var previews: some View {
        main_view()
    }
}
