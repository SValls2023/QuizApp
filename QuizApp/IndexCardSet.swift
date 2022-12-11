//
//  IndexCardSet.swift
//  QuizApp
//
//  Created by csuftitan on 12/10/22.
//

import Foundation

struct IndexCardSet: Identifiable, Codable {
    var id = UUID()
    let title: String
    let subject: String
    let decription: String
    let numberOfCards: Int
    let dateCreated: Date
}
