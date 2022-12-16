//
//  IndexCard.swift
//  QuizApp
//
//  Created by csuftitan on 12/10/22.
//

import Foundation

struct IndexCard: Identifiable, Codable {
    var id = UUID()
    let term: String
    let definition: String
}
