//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Евгений Макеев on 17.12.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation
struct Question {
    let q: String
    let a: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.q = q
        self.a = a
        self.correctAnswer = correctAnswer
    }
}


