//
//  GameRecord.swift
//  MillionaireGame
//
//  Created by Федор Филимонов on 02.11.2020.
//

import Foundation

struct GameRecord: Codable {
    
    let date: Date
    let numberOfQuestions: Int
    let numberOfCorrectAnswers: Int
    let percentageOfAnsweredQuestions: Int
    
}
