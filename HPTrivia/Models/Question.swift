//
//  Question.swift
//  HPTrivia
//
//  Created by Bhavin Chauhan on 11/08/25.
//

import Foundation

// MARK: - QuizItem
struct Question: Codable, Identifiable, Equatable {
    let id: Int
    let question: String
    let answer: String
    let wrong: [String]
    let book: Int
    let hint: String

    // Identifiable uses `id`
    // Equatable synthesized automatically by the compiler
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.question = try container.decode(String.self, forKey: .question)
        self.answer = try container.decode(String.self, forKey: .answer)
        self.wrong = try container.decode([String].self, forKey: .wrong)
        self.book = try container.decode(Int.self, forKey: .book)
        self.hint = try container.decode(String.self, forKey: .hint)
    }
}

