//
//  QuizAppApp.swift
//  QuizApp
//
//  Created by csuftitan on 11/23/22.
//

import SwiftUI

@main
struct QuizAppApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            main_view()
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
