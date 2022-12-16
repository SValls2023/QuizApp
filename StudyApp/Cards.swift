//
//  Cards.swift
//  QuizApp
//
//  Created by csuftitan on 12/15/22.
//

import Foundation

class Cards: ObservableObject {
    @Published var items = [IndexCard]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([IndexCard].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

