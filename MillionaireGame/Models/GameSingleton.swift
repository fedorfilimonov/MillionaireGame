//
//  GameSingleton.swift
//  MillionaireGame
//
//  Created by Федор Филимонов on 29.10.2020.
//

import Foundation

class GameSingleton {
    
    var gameSession: GameSession?
    
    static let shared = GameSingleton()
    
    private var percentageOfAnsweredQuestions = 0.0
    
    private let gameRecordCaretaker = GameRecordCaretaker()
    
    private(set) var gameResults: [GameRecord] {
        didSet {
            gameRecordCaretaker.saveGameResults(results: gameResults)
        }
    }
    
    private init(){
        gameResults = gameRecordCaretaker.loadGameResults() ?? []
    }
    
    func addGameResult(result: GameRecord) {
        gameResults.insert(result, at: 0)
        gameSession = GameSession()
    }
    
    func clearAllGameResults() {
        gameResults.removeAll()
    }
}
