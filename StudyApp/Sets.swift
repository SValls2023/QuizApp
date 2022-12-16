//
//  Sets.swift
//  QuizApp
//
//  Created by csuftitan on 12/10/22.
//

import Foundation

class Sets: ObservableObject {
    @Published var cardSets = [IndexCardSet]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(cardSets) {
                UserDefaults.standard.set(encoded, forKey: "Items1")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items1") {
            if let decodedItems = try? JSONDecoder().decode([IndexCardSet].self, from: savedItems) {
                cardSets = decodedItems
                return
            }
        }
        
        cardSets = []
    }
}
