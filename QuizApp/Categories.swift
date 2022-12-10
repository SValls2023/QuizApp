//
//  Categories.swift
//  QuizApp
//
//  Created by csuftitan on 12/10/22.
//

import Foundation

class Categories: ObservableObject {
    @Published var items = [IndexCardCategory]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([IndexCardCategory].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
