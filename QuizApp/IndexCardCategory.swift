//
//  IndexCardCategory.swift
//  QuizApp
//
//  Created by csuftitan on 12/10/22.
//

import Foundation

struct IndexCardCategory: Identifiable, Codable {
    var id = UUID()
    let title: String
    let subject: String
    let decription: String
}
