//
//  SequentialOrderStrategy.swift
//  MillionaireGame
//
//  Created by Федор Филимонов on 04.11.2020.
//

import Foundation

class SequentialOrderStrategy: QuestionOrderStrategy {
    
    var questions: [Question]  = []
    
    func createArrayOfQuestions() -> [Question] {
        
        var questions: [Question] = []
        
        guard gameContent.first != nil else { return questions }
        
        for index in 0..<gameContent.count {
            questions.append(gameContent[index])
        }
        
        guard QuestionsSingleton.shared.questionsList.first != nil else { return questions }
        
        for index in 0..<QuestionsSingleton.shared.questionsList.count {
            questions.append(QuestionsSingleton.shared.questionsList[index])
        }
        
        print("\n\n")
        print("Questions on strategy")
        print(questions)
        print("\n\n")
        
        return questions
    }
}
